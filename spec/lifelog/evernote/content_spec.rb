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

  describe '#validate_before_render' do
    subject { instance.validate_before_render }

    shared_examples_for 'create all value for erb' do
      it { expect(subject).to eq [:@tweet] }
    end

    context 'already set' do
      before { instance.instance_variable_set("@tweet", ['some tweet']) }
      it_behaves_like 'create all value for erb'
      it { subject; expect(instance.instance_eval { @tweet }).to eq ['some tweet']}
    end
    context 'no variable' do
      it_behaves_like 'create all value for erb'
      it { subject; expect(instance.instance_eval { @tweet }).to eq ['no-data']}
    end
  end
end
