require 'spec_helper'

describe Lifelog::App::Evernote do
  let(:instance) { described_class.new }

  describe '#publish' do
    subject { instance.publish('title', 'content', false) }
    before do
      Lifelog::Dom::Repository::Evernote.any_instance.should_receive(:save).with('title', 'content')
    end

    it { expect { subject }.not_to raise_error }
  end
end
