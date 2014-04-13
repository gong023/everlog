require 'spec_helper'

describe Lifelog::Inf::Api::Hatena do
  let(:instance) do
    config = double('config',
                    consumer_key: ENV['hatena_consumer_key'],
                    consumer_secret: ENV['hatena_consumer_sec'],
                    access_token: ENV['hatena_access_token'],
                    access_secret: ENV['hatena_access_secret'])
    described_class.new(config)
  end

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
