require 'spec_helper'

describe Everlog::Dom::Module::Twitter do

  describe '.fetch_since' do
    subject { described_class.fetch_since (DateTime.now - 1).to_time }
    before { allow_any_instance_of(Everlog::Inf::Api::Twitter).to receive(:timeline).and_return(response) }

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

    context 'with no response data' do
      let(:response) { [] }
      it { expect(subject).to eq [] }
    end
  end
end
