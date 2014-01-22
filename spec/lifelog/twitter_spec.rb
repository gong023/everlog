require 'spec_helper'

describe Lifelog::Twitter do
  let(:instance) { described_class.new }
  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#today' do
    subject { instance.today }
    it { expect { subject }.not_to raise_error }
  end
end
