require 'spec_helper'

describe Artist do

  describe "validations" do

    describe "presence" do
      [:name, :description, :email].each do |attr|
        it { should validate_presence_of(attr) }
      end
    end

    describe "uniqueness" do

      it {should validate_uniqueness_of(:email) }
    end

    describe "email" do

      it { should allow_value("flavia@gmail.com").for(:email) }
      it { should_not allow_value("wrong").for(:email) }
    end
  end

  describe "Paperclip" do

    describe "avatar" do

      it { should have_attached_file(:avatar) }
    end
  end
end
