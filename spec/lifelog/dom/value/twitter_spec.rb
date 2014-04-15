require 'spec_helper'

describe Everlog::Dom::Value::Twitter do
  let(:instance) { described_class.new(response) }

  describe '#tweet' do
    context 'with Twitter::Tweet nil' do
      subject { instance.tweet }
      let(:response) { double('Twitter::Tweet', text: nil) }

      it { expect(subject).to eq '' }
    end
  end

  describe '#created_at' do
    context 'with Twitter::Tweet nil' do
      subject { instance.created_at }
      let(:response) { double('Twitter::Tweet', created_at: nil) }

      it { expect(subject).to eq '' }
    end
  end
end
