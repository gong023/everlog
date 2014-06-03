require 'spec_helper'

describe Everlog::Dom::Value::Footer do
  let(:instance) { described_class.new(phrase) }

  describe '#phrase' do
    let(:phrase) { 'hoge' }
    it { expect(instance.phrase).to eq 'hoge' }
  end
end
