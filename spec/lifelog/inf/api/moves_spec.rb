require 'spec_helper'

describe Lifelog::Inf::Api::Moves do
  let(:instance) { described_class.new }

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end
end
