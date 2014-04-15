require 'spec_helper'

describe Everlog::Maybe do
  include Everlog::Maybe

  describe '#maybe' do
    subject { maybe(nil) }

    context 'nil' do
      it { expect(subject).to be_instance_of Everlog::NullObject }
      it { expect(subject.to_a).to eq [] }
      it { expect(subject.to_s).to eq '' }
      it { expect(subject.to_i).to eq 0 }
      it { expect(subject.to_f).to eq 0.0 }
      it { expect(subject[:invalid_key]).to be_instance_of Everlog::NullObject }
      it { expect(subject.undefined_method).to be_instance_of Everlog::NullObject }
    end
  end
end
