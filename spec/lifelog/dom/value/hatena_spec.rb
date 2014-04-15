require 'spec_helper'

describe Everlog::Dom::Value::Hatena do
  let(:instance) { described_class.new(response) }

  describe '#title' do
    subject { instance.title }

    context 'with no title in response' do
      let(:response) { {} }
      it { expect(subject).to eq '' }
    end
  end

  describe '#issued' do
    subject { instance.issued }

    context 'with no issued in response' do
      let(:response) { {} }
      it { expect(subject).to be_instance_of Time }
    end
  end
end
