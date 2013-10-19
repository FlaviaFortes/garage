require 'spec_helper'

describe Artist do

  describe "validations" do

    [:name, :description, :email].each do |attr|
      it { should validate_presence_of(attr) }
    end

    it {should validate_uniqueness_of(:email) }  
  end
end
