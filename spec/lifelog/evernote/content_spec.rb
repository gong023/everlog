require 'spec_helper'

describe Lifelog::Evernote::Content do
  let(:instance) { described_class.new }

  describe '#render' do
    subject { instance.render }
    before { instance.push(:tweet, ['hoge']) }

    it 'has en-note tag' do
      expect(subject).to match /<en-note>/
      expect(subject).to match /<\/en-note>$/
    end
  end
end
