require 'spec_helper'

describe Lifelog::Dom::Value::Weather do
  let(:valid_response) do
    load_fixture('wunderground/yesterday_response.json')['history']
  end

  describe '#max_temp' do
    context 'normal' do
      subject { described_class.new(valid_response).max_temp }
      it { expect(subject).to be 10 }
    end

    context 'abnormal' do
      subject { described_class.new(nil).max_temp }
      it { expect(subject).to be 0 }
    end
  end

  describe '#max_temp' do
    context 'normal' do
      subject { described_class.new(valid_response).min_temp }
      it { expect(subject).to be 7 }
    end

    context 'abnormal' do
      subject { described_class.new(nil).max_temp }
      it { expect(subject).to be 0 }
    end
  end

  describe '#condition' do
    context 'normal' do
      subject { described_class.new(valid_response).condition }
      it { expect(subject).to eq 'rain' }
    end

    context 'abnormal' do
      subject { described_class.new(nil).condition }
      it { expect(subject).to eq '' }
    end
  end
end
