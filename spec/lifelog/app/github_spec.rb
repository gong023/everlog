require 'spec_helper'

describe Everlog::App::Github do
  describe '#fetch_since' do
    subject { described_class.fetch_since((DateTime.now - 1).to_time) }

    context 'with no repository existing' do
      before { Everlog::Dom::Module::Github.any_instance.stub(:repo_names).and_return([]) }

      it { expect(subject).to eq [] }
    end

    context 'with no commit existing in repository' do
      before do
        Everlog::Dom::Module::Github.any_instance.stub(:repo_activity).and_return(nil)
        Everlog::Dom::Module::Github.any_instance.stub(:repo_names).and_return(['Everlog'])
      end

      it { expect(subject).to eq [] }
    end
  end
end
