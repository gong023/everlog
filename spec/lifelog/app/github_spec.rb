require 'spec_helper'

describe Lifelog::App::Github do
  describe '#fetch_since' do
    subject { described_class.fetch_since((DateTime.now - 1).to_time) }

    context 'with no repository existing' do
      before { Lifelog::Dom::Module::Github.any_instance.stub(:repo_names).and_return([]) }

      it { expect(subject).to eq [] }
    end

    context 'with no commit existing in repository' do
      before do
        Lifelog::Dom::Module::Github.any_instance.stub(:repo_activity).and_return(nil)
        Lifelog::Dom::Module::Github.any_instance.stub(:repo_names).and_return(['lifelog'])
      end

      it { expect(subject).to eq [] }
    end
  end
end
