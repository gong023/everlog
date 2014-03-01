require 'spec_helper'

describe Lifelog::Inf::Api::Twitter do
  let(:instance) { described_class.new }
  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#timeline' do
    subject { instance.timeline }
    it { expect(subject.size).to be 200 }
  end
end
