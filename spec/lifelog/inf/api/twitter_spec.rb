require 'spec_helper'

describe Lifelog::Inf::Api::Twitter do
  let(:instance) do
    config = double('config',
                    consumer_key: ENV['twitter_consumer_key'],
                    consumer_secret: ENV['twitter_consumer_sec'],
                    access_token: ENV['twitter_access_token'],
                    access_secret: ENV['twitter_access_secret'])
    described_class.new(config)
  end

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
