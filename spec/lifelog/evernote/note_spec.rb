require 'spec_helper'

describe Lifelog::Evernote::Note do
  let(:instance) { described_class.new }

  describe '#post' do
    subject { instance.post(title, content) }

    context 'normal case' do
      let(:title) { 'test_title' }
      let(:content) do
<<EOS
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>
<en-note> <div>hi</div> <div>hello</div> </en-note>
EOS
      end

      it { expect { subject }.not_to raise_error }
    end
  end
end
