require 'spec_helper'

describe Lifelog::Dom::Value::Moves::Move do
  let(:instance) { described_class.new(response) }
  let(:response) do
    load_fixture('moves/daily_storyline_response.json').first['segments'][1]['activities'].first
  end

  describe '#action' do
    subject { instance.action }
    context 'normal case' do
      it { expect(subject).to eq 'wlk' }
    end
  end

  describe '#duration' do
    subject { instance.duration }
    context 'normal case' do
      it 'round of' do
        expect(subject).to eq '13.0'
      end
    end
  end

  describe '#start_time' do
    subject { instance.start_time }
    context 'normal case' do
      it { expect(subject).to eq '16:14' }
    end
  end

  describe '#end_time' do
    subject { instance.end_time }
    context 'normal case' do
      it { expect(subject).to eq '16:27' }
    end
  end

  describe '#distance' do
    subject { instance.distance }
    context 'normal case' do
      it { expect(subject).to be 1.251 }
    end
  end
end
