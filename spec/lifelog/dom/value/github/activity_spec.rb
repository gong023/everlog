require 'spec_helper'

describe Lifelog::Dom::Value::Github::Repository_Activity do
  let(:instance) { described_class.new(repo_name, repo_commits) }

  describe '#repo_name' do
    context 'nil' do
      let(:repo_name) { nil }
      let(:repo_commits) { nil }
      subject { instance.repo_name }

      it { expect(subject).to eq '' }
    end
  end

  describe '#commits' do
    context 'nil' do
      let(:repo_name) { nil }
      let(:repo_commits) { nil }
      subject { instance.commits }

      it { expect(subject).to eq [] }
    end
  end
end
