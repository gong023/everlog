require 'spec_helper'

describe Lifelog::Dom::Value::Animetick do
  let(:instance) { described_class.new(response) }

  context 'normal' do
    let(:response) do
      {
        "title_id" => 1,
        "count" => 1,
        "updated_at" => "2014-03-12T21:20:11.000+09:00",
        "watched" => true,
        "title" => "anime title",
        "icon_path" => "/icon/1.png",
        "sub_title" => "episode",
        "start_at" => "2014-03-11T01:35:00+09:00",
        "end_at "=> "2014-03-11T02:05:00+09:00",
        "flags" => [],
        "ch_name" => "テレビ東京",
        "ch_number" => 7
      }
    end

    describe '#title' do
      subject { instance.title }
      it { expect(subject).to eq 'anime title' }
    end

    describe '#sub_title' do
      subject { instance.sub_title }
      it { expect(subject).to eq 'episode' }
    end

    describe '#count' do
      subject { instance.count }
      it { expect(subject).to be 1 }
    end

    describe '#updated_at' do
      subject { instance.updated_at }
      it { expect(subject).to eq DateTime.new(2014, 3, 12, 21, 20, 11, '+9').to_time }
    end

    describe '#updated_at_screen' do
      subject { instance.updated_at_screen }
      it { expect(subject).to eq '21:20' }
    end
  end
end
