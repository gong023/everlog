require 'spec_helper'

describe Lifelog::Inf::Api::Evernote do
  let(:instance) do
    config = double('config', access_secret: ENV['evernote_sandbox_access_token'])
    described_class.new(true, config)
  end

  describe '#client' do
    subject { instance.client }
    it 'memo @client' do
      expect(subject).to be instance.client
    end
  end

  describe '#note' do
    it 'memo @note' do
      expect(instance.note).to be instance.note
    end
  end

  describe '#post_note' do
    before { EvernoteOAuth::Client.any_instance.stub_chain(:note_store, :createNote) }
      let(:content) do
<<EOS
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>
<en-note> <div>hi</div> <div>hello</div> </en-note>
EOS
      end

    it { expect { instance.post_note('title', content) }.not_to raise_error }
  end

  describe '#create_notebook' do
    subject { instance.create_notebook(title) }

    context 'duplicate notebook title' do
      let(:title) { 'from rspec' }
      it { expect { subject }.to raise_error ::Evernote::EDAM::Error::EDAMUserException }
    end
  end

  describe '#notebooks' do
    subject { instance.notebooks }

    it { expect(subject).to be_instance_of Array }
  end
end
