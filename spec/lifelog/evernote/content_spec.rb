require 'spec_helper'

describe Lifelog::Evernote::Content do
  let(:instance) { described_class.new }

  describe '#render' do
    subject { instance.render }
    let(:moves_mock) { load_fixture('moves/sample_for_erb.json') }
    before do
      instance.push(:twitter, ['hoge'])
      instance.push(:moves, moves_mock)
    end

    xit 'has en-note tag' do
      expect(subject).to match /<en-note>/
      expect(subject).to match /<\/en-note>$/
    end
  end
end
