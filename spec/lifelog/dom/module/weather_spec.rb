require 'spec_helper'

describe Everlog::Dom::Module::Weather do

  describe '.fetch_since' do
    before do
      response = load_fixture('wunderground/yesterday_response.json')['response']
      Everlog::Inf::Api::Wunderground.any_instance.should_receive(:yesterday).and_return(response)
    end

    subject { described_class.fetch_since('dummy') }
    it { expect(subject.max_temp).to be_instance_of Fixnum }
    it { expect(subject.min_temp).to be_instance_of Fixnum }
    it { expect(subject.condition).to be_instance_of String }
  end
end
