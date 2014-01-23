require 'spec_helper'

describe Lifelog::Article do
  include Lifelog::Article

  describe '#to_markdown' do
    subject { to_markdown(hash) }

    context 'simple' do
      let(:hash) { { h1: ['list1', 'list2'] } }
      let(:markdown) { "# h1\n - list1\n - list2\n" }

      it { expect(subject).to eq markdown }
    end

    context 'nested' do

    end
  end
end
