require 'spec_helper'

describe Audio do

  describe "validations" do

    describe "presence" do
      it { should validate_presence_of(:url) }
    end
  end

  describe "associations" do

    it { should belong_to(:artist) }
  end
end
