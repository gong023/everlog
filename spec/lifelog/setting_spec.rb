require 'spec_helper'

describe Lifelog::Setting do
  include Lifelog::Setting
  describe '.file' do
    it {
      pp file
      pp config
      expect(true).to be_true
    }
  end
end
