require 'spec_helper'

describe Lifelog::Moves::Move do
  let(:instance) { described_class.new(table) }
  let(:table) do
    load_fixture('moves/daily_storyline_response.json').first['segments'][1]
  end
  let(:act) { table['activities'].first }

  describe '#time' do
    subject { instance.time(act) }

    it { expect(subject).to eq '01:14:30 ~ 01:27:32 (13min)' }
  end

  describe '#distance' do
    subject { instance.distance(act) }

    it { expect(subject).to eq "1.251km" }
  end
end
