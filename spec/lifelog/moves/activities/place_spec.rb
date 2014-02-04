require 'spec_helper'

describe Lifelog::Moves::Place do
  let(:instance) { described_class.new(table) }
  let(:table) do
    {
      'id' => 1,
      'type' => "unknown",
      'location' => {
        'lat' => 35.6605372,
        'lon' => 139.7305918802915
      }
    }
  end

  describe '#screen_name' do
    subject { instance.screen_name }
    it { expect(subject).not_to be_empty }
  end
end
