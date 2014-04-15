require 'spec_helper'

describe Everlog::Dom::Value::Moves::Referer::Move do
  let(:instance) { described_class.new(response) }
  let(:response) do
    load_fixture('moves/daily_storyline_response.json').first['segments'][1]
  end

  describe '#name' do
    it { expect(instance.name).to eq 'move' }
  end

  describe '#to_a' do
    subject { instance.to_a }
    it { expect(subject).to be_instance_of Array }
    it { expect(subject.first.action).to eq 'wlk' }
  end
end
