require 'spec_helper'

describe Lifelog::TwitterApp do
  let(:instance) { described_class.new }
  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#today' do
    subject { instance.today }
    before { described_class.any_instance.stub_chain(:client, :user_timeline).and_return(response) }

    let(:valid_date_tweet) { double('Twitter:Tweet', text: 'hello', created_at: DateTime.now.to_time) }
    let(:invalid_date_tweet) { double('Twitter:Tweet', text: 'invalid date', created_at: (DateTime.now - 2).to_time) }

    shared_examples_for 'valid result' do
      it { expect(subject).to be_instance_of Array }
      it { expect(subject.size).to be 2 }
      it { expect(subject[0].tweet).to eq 'hello' }
    end

    context 'normal case' do
      let(:response) { [valid_date_tweet, valid_date_tweet] }
      it_behaves_like 'valid result'
    end

    context 'with too old tweet existing' do
      let(:response) { [valid_date_tweet, valid_date_tweet, invalid_date_tweet]}
      it_behaves_like 'valid result'
    end

    context 'with Twitter::Tweet nil' do
      let(:response) { [double('Twitter::Tweet', text: nil, created_at: DateTime.now.to_time)] }
      it { expect(subject[0].tweet).to eq '' }
    end
  end
end
