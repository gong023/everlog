require 'spec_helper'

describe Everlog::Dom::Value::Github::Commit do
  let(:instance) { described_class.new(response) }

  describe '#url' do
    subject { instance.url }

    context 'nil' do
      let(:response) { double('response', rels: { html: double('href', href: nil) }) }
      it { expect(subject).to eq '' }
    end
  end

  describe '#message' do
    subject { instance.message }

    context 'nil' do
      let(:response) { double('response', commit: { message: nil }) }
      it { expect(subject).to eq '' }
    end
  end
end
