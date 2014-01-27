require 'spec_helper'
require 'json'

describe Lifelog::Moves do
  let(:instance) { described_class.new }

  describe '#client' do
    subject { instance.client }
    it { expect { subject }.not_to raise_error }
  end

  describe '#today' do
    subject { instance.today }
    it { expect { subject }.not_to raise_error }
  end

end
