require 'spec_helper'

describe Lifelog::Evernote::Content do
  let(:instance) { described_class.new }

  describe '#push' do
    subject { instance.push('en-note', 'hello') }

    context 'once single tag' do
      it { expect(subject).to eq({ 'en-note' => 'hello' }) }
    end

    context 'many times by the same tag' do
      it 'add article into tag already exists' do
        pushed = {}; 2.times { pushed = instance.push('en-note', 'hello') }
        expect(pushed).to eq({ 'en-note' => 'hellohello' })
      end
    end
  end

  describe '#dump' do
    before { instance.should_receive(:tagged).and_return({ tag => article }) }
    subject { instance.dump }

    context 'with plain text' do
      let(:tag) { 'en-note' }
      let(:article) { '#h1-list1-list1' }

      it { expect(subject).to eq "#{instance.header}<#{tag}>#{article}</#{tag}>"}
    end
  end
end
