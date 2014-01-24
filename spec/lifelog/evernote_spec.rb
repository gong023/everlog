require 'spec_helper'

describe Lifelog::Evernote do
  include Lifelog::Evernote

  describe "#client" do
    it "memo .client" do
      expect(client).to be client
    end
  end
end
