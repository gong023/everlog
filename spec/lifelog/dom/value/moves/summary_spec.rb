require 'spec_helper'

describe Everlog::Dom::Value::Moves::Summary do
  let(:instance) { described_class.new(response) }

  shared_examples_for 'return fixture val with normal case and return 0.0 with abnormal case' do
    context 'normal' do
      let(:response) { load_fixture('moves/daily_summary_response.json').first['summary'] }
      it { expect(subject).to be fixture_val }
    end

    context 'abnormal' do
      context 'with no applied activity' do
        let(:response) do
          r = load_fixture('moves/daily_summary_response.json').first['summary']
          r.delete_at(fixture_index)
          r
        end

        it { expect(subject).to be 0.0 }
      end

      context 'with response nil' do
        let(:response) { nil }
        it { expect(subject).to be 0.0 }
      end

      context 'with response empty array' do
        let(:response) { [] }
        it { expect(subject).to be 0.0 }
      end
    end
  end


  describe '#walk' do
    subject { instance.walk }
    let(:fixture_index) { 0 }
    let(:fixture_val) { 1.847 }
    it_behaves_like 'return fixture val with normal case and return 0.0 with abnormal case'
  end

  describe '#cycle' do
    subject { instance.cycle }
    let(:fixture_index) { 2 }
    let(:fixture_val) { 4.049 }
    it_behaves_like 'return fixture val with normal case and return 0.0 with abnormal case'
  end

  describe '#transport' do
    subject { instance.transport }
    let(:fixture_index) { 3 }
    let(:fixture_val) { 0.419 }
    it_behaves_like 'return fixture val with normal case and return 0.0 with abnormal case'
  end

  describe '#cal' do
    subject { instance.cal }
    let(:response) { load_fixture('moves/daily_summary_response.json').first['summary'] }
    context 'normal' do
      it { expect(subject).to be 1098 }
    end
  end
end
