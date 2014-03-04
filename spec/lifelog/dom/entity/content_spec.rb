require 'spec_helper'

describe Lifelog::Dom::Entity::Content do
  let(:instance) { described_class.new }

  describe '#push' do
    it 'set instance value' do
      instance.push(:hoge, 'hoge')
      expect(instance.instance_eval { @hoge }).to eq 'hoge'
    end
  end

  describe '#render' do
    subject { instance.render }

    context 'without contents' do
      it 'has en-note tag' do
        expect(subject).to match /<en-note>/
        expect(subject).to match /<\/en-note>$/
      end
    end
  end
end
