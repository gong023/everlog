require 'spec_helper'

describe Everlog::Inf::Api::Moves do
  let(:instance) do
    described_class.new(double('config', access_secret: ENV['moves_access_token']))
  end

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#daily_summary' do
    it { expect { instance.daily_summary }.not_to raise_error }
  end

end
