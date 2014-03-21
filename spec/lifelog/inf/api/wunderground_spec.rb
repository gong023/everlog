require 'spec_helper'

describe Lifelog::Inf::Api::Wunderground do
  let(:instance) { described_class.new }

  describe '#yesterday' do
    it { expect { instance.yesterday('Tokyo') }.not_to raise_error }
  end
end
