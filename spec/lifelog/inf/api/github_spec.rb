require 'spec_helper'

describe Everlog::Inf::Api::Github do
  let(:instance) do
    described_class.new(double('config', access_secret: ENV['github_access_secret']))
  end

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#repos' do
    subject { instance.repos }
    it { expect(subject).to be_instance_of Array }
  end

  describe '#commits_on' do
    subject { instance.commits_on(repo, date) }
    let(:repo) { 'everlog' }

    context 'with commit existing' do
      let(:date) { '2014-01-17' }

      it { expect(subject).to be_instance_of Array }
      it { expect(subject.size).to be 2 }
    end

    context 'with no commit existing' do
      let(:date) { '9999-09-09' }

      it { expect(subject).to eq [] }
    end
  end
end
