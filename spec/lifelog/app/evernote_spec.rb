require 'spec_helper'

describe Everlog::App::Evernote do
  describe '#publish' do
    subject { described_class.publish('title', 'content', false) }
    before do
      Everlog::Dom::Repository::Evernote.any_instance.should_receive(:save).with('title', 'content')
    end

    it { expect { subject }.not_to raise_error }
  end
end
