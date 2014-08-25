require 'spec_helper'

describe Everlog::Dom::Value::Moves::Referer::Place do
  let(:instance) { described_class.new(response) }
  let(:response) do
    load_fixture('moves/daily_storyline_response.json').first['segments'][0]
  end

  describe '#name' do
    it { expect(instance.name).to eq 'place' }
  end

  describe '#screen_name' do
    subject { instance.screen_name }
    it { is_expected.to match /ロシア/ }
  end
end
