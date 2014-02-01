require 'spec_helper'
require 'json'

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

    shared_examples_for 'have correct keys' do
      it { expect(subject).to have_key :summary }
      it { expect(subject[:summary].keys).to eq [:cal, :walk, :cycle, :trp] }
    end

    context 'without mock' do
      it { expect { subject }.not_to raise_error }
      it_behaves_like 'have correct keys'
    end

    context 'with mock' do
      let(:json) { load_fixture('moves/daily_summary_response.json') }
      before { ::Moves::Client.any_instance.should_receive(:daily_summary).and_return(json) }

      it_behaves_like 'have correct keys'

      it 'correspond to mock value' do
        expect(subject[:summary][:cal]).to be 1098
        expect(subject[:summary][:walk]).to be 1847
        expect(subject[:summary][:cycle]).to be 4049
        expect(subject[:summary][:trp]).to be 0
      end
    end
  end
end
