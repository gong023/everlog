require 'spec_helper'

describe Everlog::Inf::Api::Animetick do
  let(:instance) do
    config = double('config', access_token: ENV['animetick_session'], access_secret: ENV['animetick_csrf_token'])
    described_class.new(config)
  end

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#ticket_list' do
    subject { instance.ticket_list }
    it { expect(subject).to be_instance_of Array }
    it { expect(subject.first).to have_key 'title' }
    it { expect(subject.first).to have_key 'sub_title' }
    it { expect(subject.first).to have_key 'updated_at' }
  end
end
