require 'spec_helper'

describe Lifelog::Github do
  include Capybara::DSL
  let(:instance) { described_class.new }

  describe '#login' do
    subject { instance.login }
#    it { expect { subject }.not_to raise_error }
#    it { expect { find_by_id 'user-links' }.not_to raise_error }
    it { expect { instance.login }.not_to raise_error }
  end
end
