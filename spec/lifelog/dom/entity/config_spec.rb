require 'spec_helper'

describe Everlog::Dom::Entity::Config do
  subject { described_class }

  context 'normal' do
    it do
      expect(subject.twitter.access_token).to be_nil
      expect { subject.twitter.access_token = 'hoge' }.not_to raise_error
      expect(subject.twitter.access_token).to eq 'hoge'
      subject.evernote.access_token = 'fuga'
      subject.clear!
      expect(subject.twitter.access_token).to be_nil
      expect(subject.evernote.access_token).to be_nil
    end
  end

  context 'abnormal' do
    it { expect { subject.invalid_service.access_token }.to raise_error NoMethodError }
    it { expect { subject.twitter.invalid_method }.to raise_error NoMethodError }
  end
end
