require 'spec_helper'

describe Everlog::Inf::Api::GoogleMap do
  let(:instance) { described_class.new }

  describe '#initialize' do
    it { expect { instance }.not_to raise_error }
  end
end
