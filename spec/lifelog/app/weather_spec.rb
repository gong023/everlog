require 'spec_helper'

describe Lifelog::App::Weather do

  describe '.yesterday' do
    subject { described_class.yesterday }
    it { expect(subject.max_temp).to be_instance_of Fixnum }
    it { expect(subject.min_temp).to be_instance_of Fixnum }
    it { expect(subject.condition).to be_instance_of String }
  end
end
