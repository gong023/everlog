require 'spec_helper'

describe Lifelog::App::Animetick do
  describe '#fetch_since' do
    subject { described_class.fetch_since((DateTime.now - 1).to_time) }
    #before { Lifelog::Inf::Api::Animetick.any_instance.stub(:ticket_list).and_return(response) }

    context 'normal' do
      let(:response) { load_fixture('animetick/list_ticket_response.json') }

      it { expect { subject }.not_to raise_error }
    end
  end
end
