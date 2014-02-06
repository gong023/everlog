require 'spec_helper'

describe Lifelog::Moves do
  let(:instance) { described_class.new }

  describe '#client' do
    subject { instance.client }
    it { expect { subject }.not_to raise_error }
  end

  describe '#today' do
    subject { instance.today }
    it { expect { subject }.not_to raise_error }
  end

  describe '#summary' do
    subject { instance.summary }

    context 'with mock' do
      let(:json) { load_fixture('moves/daily_summary_response.json') }
      before { ::Moves::Client.any_instance.should_receive(:daily_summary).and_return(json) }

      it { subject.keys.should =~ [:cal, :walk, :cycle, :trp] }

      it 'correspond to mock value' do
        expect(subject[:cal]).to be 1098
        expect(subject[:walk]).to be 1847
        expect(subject[:cycle]).to be 4049
        expect(subject[:trp]).to be 0
      end
    end

    context 'without mock' do
      it { expect { subject }.not_to raise_error }
      it { subject.keys.should =~ [:cal, :walk, :cycle, :trp] }
    end
  end

  describe '#storyline' do
    subject { instance.storyline }

    shared_examples_for 'have correct keys' do
      it { subject.first.keys.should =~ [:place, :move] }
      it { subject.first[:move].first.keys.should =~ [:action, :time, :distance] }
    end

    context 'with mock' do
      let(:json) { load_fixture('moves/daily_storyline_response.json') }
      before { ::Moves::Client.any_instance.should_receive(:daily_storyline).and_return(json) }

      it_behaves_like 'have correct keys'
    end

    context 'without mock' do
      it { expect { subject }.not_to raise_error }
      it_behaves_like 'have correct keys'
    end
  end
end
