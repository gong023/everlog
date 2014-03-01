require 'spec_helper'

describe Lifelog::App::Twitter do

  describe '.fetch_since' do
    subject { described_class.fetch_since (DateTime.now - 1).to_time }
    before { Lifelog::Inf::Api::Twitter.any_instance.stub(:timeline).and_return(response) }

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
      let(:response) { [valid_date_tweet, valid_date_tweet, invalid_date_tweet] }
      it_behaves_like 'valid result'
    end
  end
end
