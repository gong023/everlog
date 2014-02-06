require 'spec_helper'

describe Lifelog::Moves::Place do
  let(:instance) { described_class.new(table) }
  let(:table) do
    load_fixture('moves/daily_storyline_response.json').first['segments'].first
  end

  describe '#screen_name' do
    subject { instance.screen_name }
    it { expect(subject).to eq "O18, スモレンスク ロシア / ロシア スモレンスク ホルム＝ジルコフスキー / " }
  end
end
