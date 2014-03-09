require 'spec_helper'

describe Lifelog::App::Moves do
  describe '#fetch_since' do
    subject { described_class.fetch_since((DateTime.now - 1).to_time) }
    it { expect(subject).to have_key :summary }
    it { expect(subject).to have_key :storyline }
  end
end
