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
      let(:response) { open(File.dirname(__FILE__) + "/moves_response.json") { |io| JSON.load(io)} }
      it 'hoge' do
        subject
        expect(true).to be_true
      end
    end
  end
end
