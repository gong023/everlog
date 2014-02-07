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

    it 'has en-note tag' do
      expect(subject).to match /<en-note>/
      expect(subject).to match /<\/en-note>$/
    end
  end

  describe '#validate_before_render' do
    subject { instance.validate_before_render }

    shared_examples_for 'create all value for erb' do
      it { expect(subject).to eq [:@twitter, :@moves] }
    end

    context 'already set' do
      before do
        instance.instance_variable_set("@twitter", ['some tweets'])
        instance.instance_variable_set("@moves", ['some moves'])
      end

      it_behaves_like 'create all value for erb'
      it { subject; expect(instance.instance_eval { @twitter }).to eq ['some tweets']}
      it { subject; expect(instance.instance_eval { @moves }).to eq ['some moves']}
    end
    context 'no variable' do
      it_behaves_like 'create all value for erb'
      it { subject; expect(instance.instance_eval { @twitter }).to eq ['no-data']}
    end
  end
end
