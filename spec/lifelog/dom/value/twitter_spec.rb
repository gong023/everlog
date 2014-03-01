require 'spec_helper'

describe Lifelog::Dom::Value::Twitter do
  let(:instance) { described_class.new(response) }

  context '#tweet' do
    context 'with Twitter::Tweet nil' do
      subject { instance.tweet }
      let(:response) { double('Twitter::Tweet', text: nil) }

      it { expect(subject).to eq '' }
    end
  end
end
