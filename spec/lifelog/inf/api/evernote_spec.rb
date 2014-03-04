require 'spec_helper'

describe Lifelog::Inf::Api::Evernote do
  let(:instance) { described_class.new(true) }

  describe '#client' do
    subject { instance.client }
    it 'memo @client' do
      expect(subject).to be instance.client
    end

    context 'with sandbox true' do
      it do
        expect(subject.instance_eval { @sandbox }).to be_true
        expect(subject.instance_eval { @token }).to eq ENV['evernote_sandbox_access_token']
      end
    end

    context 'with sandbox false' do
      let(:instance) { described_class.new(false) }
      it do
        expect(subject.instance_eval { @sandbox }).to be_false
        expect(subject.instance_eval { @token }).to eq ENV['evernote_access_token']
      end
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
end
