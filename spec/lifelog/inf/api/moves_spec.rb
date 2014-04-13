require 'spec_helper'

describe Lifelog::Inf::Api::Moves do
  let(:instance) do
    described_class.new(double('config', access_secret: ENV['moves_access_token']))
  end

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end
end
