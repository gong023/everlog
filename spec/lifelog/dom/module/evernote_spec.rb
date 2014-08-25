require 'spec_helper'

describe Everlog::Dom::Module::Evernote do
  describe '#publish' do
    subject { described_class.publish('title', 'content', false) }
    before do
      expect_any_instance_of(Everlog::Dom::Repository::Evernote).to receive(:save).with('title', 'content')
    end

    it { expect { subject }.not_to raise_error }
  end
end
