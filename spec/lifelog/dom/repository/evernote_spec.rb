require 'spec_helper'

describe Everlog::Dom::Repository::Evernote do
  let(:instance) do
    config = double('config', access_secret: ENV['evernote_sandbox_access_token'])
    described_class.new(true, config)
  end

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
        expect_any_instance_of(Everlog::Inf::Api::Evernote).to receive(:create_notebook).and_return(api_mock)
        expect(subject).to be 1
      end
    end
  end
end
