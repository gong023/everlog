require 'spec_helper'

describe Lifelog::Github do
  let(:instance) { described_class.new }

  describe '#client' do
    it 'memo @client' do
      expect(instance.client).to be instance.client
    end
  end

  describe '#today' do
    subject { instance.today }
    it { expect { subject }.not_to raise_error }
  end

  describe '#all_repos' do
    subject { instance.all_repos }
    it { expect(subject).to be_instance_of Array }
    it { expect(subject).to include 'gong023/lifelog' }
  end

  describe '#commit_summary_on' do
    subject { instance.commit_summary(repo, date) }
    let(:repo) { 'lifelog' }

    context 'commit exist' do
      let(:date) { DateTime.parse('2014-01-17 00:00:00 JST').to_time.utc }

      it { expect(subject.size).to be 2 }
      it { expect(subject.first).to have_key :message }
      it { expect(subject.first).to have_key :url }
      it { expect(subject.first[:message]).to eq 'initial commit' }
      it { expect(subject.first[:url]).to eq 'https://github.com/gong023/lifelog/commit/92e4edb00fdc6bb1be9f2696c2a56e66d52bf4af' }
    end

    context 'no commit' do
      let(:date) { '9999-09-09' }

      it { expect(subject).to be_nil }
    end
  end
end
