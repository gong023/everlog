require 'spec_helper'

describe Lifelog::Inf::Api::Hatena do
  let(:instance) { described_class.new }

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#feed_entry' do
    subject { instance.feed_entry }
    it { expect(subject).to be_instance_of Array }
  end
end
