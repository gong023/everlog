require 'spec_helper'

describe Lifelog::Dom::Repository::Evernote do
  let(:instance) { described_class.new(true) }

  describe '#get_guid_forcibly' do
    subject { instance.get_guid_forcibly notebook_name }

    context 'with notebook existing' do
      let(:notebook_name) { 'from rspec' }
      it { expect(subject).to eq '1557ebad-ce5e-4389-b3fe-d8dfdaddb181' }
    end

    context 'with no notebook existing' do
      let(:notebook_name) { 'something not existing' }
      it do
        api_mock = double('api_client', { guid: 1 })
        Lifelog::Inf::Api::Evernote.any_instance.should_receive(:create_notebook).and_return(api_mock)
        expect(subject).to be 1
      end
    end
  end
end