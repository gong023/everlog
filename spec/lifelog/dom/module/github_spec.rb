require 'spec_helper'

describe Lifelog::Dom::Module::Github do
  let(:instance) do
    described_class.new(double('config', access_secret: ENV['github_access_secret']))
  end

  describe '#api_client' do
    it 'memo @api_client' do
      expect(instance.api_client).to be instance.api_client
    end
  end

  describe '#repo_names' do
    subject { instance.repo_names }
    before do
      response = [double('api_client', full_name: 'lifelog')]
      Lifelog::Inf::Api::Github.any_instance.stub(:repos).and_return(response)
    end

    it { expect(subject).to eq ['lifelog'] }
  end

  describe '#repo_activity' do
    subject { instance.repo_activity('gong023/lifelog', date)}

    context 'with commit existing' do
      let(:date) { '2014-01-17' }

      it { expect(subject.repo_name).to eq 'gong023/lifelog' }
      it { expect(subject.commits).to be_instance_of Array }
    end

    context 'with no commit existing' do
      let(:date) { '9999-09-09' }
      before do
        described_class.any_instance.should_receive(:commits).with('lifelog', '9999-09-09').and_return(nil)
      end

      it { expect(subject).to be_nil }
    end
  end

  describe '#commits' do
    subject { instance.commits('lifelog', date) }

    context 'with commit existing' do
      let(:date) { '2014-01-17' }

      it { expect(subject.first.message).to eq 'initial commit' }
      it { expect(subject.first.url).to eq 'https://github.com/gong023/lifelog/commit/92e4edb00fdc6bb1be9f2696c2a56e66d52bf4af' }
    end

    context 'with no commit existing' do
      let(:date) { '9999-09-09' }

      it { expect(subject).to be_nil }
    end
  end
end
