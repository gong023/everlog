require 'spec_helper'

describe Everlog::Inf::Api::Wunderground do
  let(:instance) do
    described_class.new(double('config', access_token: ENV['wunderground_token']))
  end

  describe '#yesterday' do
    it { expect { instance.yesterday('Tokyo') }.not_to raise_error }
    it 'read from cache' do
      LocalFileCache.any_instance.should_receive(:get).once.and_return('sunny')

      # 一度目はcacheにセットされる
      expect { instance.yesterday('Tokyo').not_to raise_error }
      # 二度目はcacheからデータを取る
      expect(instance.yesterday('Tokyo')).to eq 'sunny'
      # キャッシュ消す
      instance.instance_eval { @cache.flush }
    end
  end
end
