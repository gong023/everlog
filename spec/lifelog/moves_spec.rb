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

  describe '#parse_to_markdown' do
    subject { instance.parse_to_markdown(response) }
    context 'valid response' do
      let(:response) { JSON.load(File.open(File.dirname(__FILE__) + "/../fixtures/moves_response.json")) }
      xit 'parse correctly' do
        subject
      end
    end
  end
end
