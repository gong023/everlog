require 'spec_helper'

describe Everlog::Dom::Value::Moves::Place do
  let(:instance) { described_class.new(response) }
  let(:response) do
    load_fixture('moves/daily_storyline_response.json').first['segments'][0]
  end

  describe '#latitude' do
    subject { instance.latitude }
    it { expect(subject).to eq '55.55555' }
  end

  describe '#longitude' do
    subject { instance.longitude }
    it { expect(subject).to eq '33.33333' }
  end
end
