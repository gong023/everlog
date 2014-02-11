require 'spec_helper'

describe Lifelog::Hatena do
  let(:instance) { described_class.new }

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#today' do
    subject { instance.today }

    it 'have correct keys' do
      expect(subject.first).to have_key 'title'
      expect(subject.first).to have_key 'link'
    end
  end
end
