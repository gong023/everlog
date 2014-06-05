require 'spec_helper'

describe Everlog::Inf::Api::Wunderground do
  let(:instance) do
    described_class.new(double('config', access_token: ENV['wunderground_token']))
  end

  describe '#yesterday' do
    it { expect { instance.yesterday('Tokyo') }.not_to raise_error }
  end
end
