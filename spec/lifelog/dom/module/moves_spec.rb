require 'spec_helper'

xdescribe Everlog::Dom::Module::Moves do
  let(:instance) do
    described_class.new
  end

  describe '#storyline' do
    subject { instance.storyline }

    context 'normal' do
      before do
        described_class.any_instance.stub_chain(:moves_api, :daily_storyline).and_return(response)
      end
      let(:response) do
        load_fixture('moves/daily_storyline_response.json').first['segments']
      end

      it { expect(subject.first).to be_instance_of Everlog::Dom::Value::Moves::Referer::Place }
      it { expect(subject[1]).to be_instance_of Everlog::Dom::Value::Moves::Referer::Move }
    end
  end

  describe '#summary' do
    subject { instance.summary }

    context 'normal' do
      before { described_class.any_instance.stub_chain(:moves_api, :daily_summary).and_return(response) }

      let(:response) do
        load_fixture('moves/daily_summary_response.json').first['summary']
      end

      it { expect(subject).to be_instance_of Everlog::Dom::Value::Moves::Summary }
    end
  end

  describe '.fetch_since' do
    subject { described_class.fetch_since((DateTime.now - 1).to_time) }
    it { expect(subject).to have_key :summary }
    it { expect(subject).to have_key :storyline }
  end
end
