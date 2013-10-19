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

  describe "paperclip" do

    describe "avatar" do

      it { should have_attached_file(:avatar) }
      it { should validate_attachment_content_type(:avatar).
                      allowing('image/png', 'image/gif', 'image/jpg').
                      rejecting('text/plain', 'text/xml') }
    end
  end

  describe "associations" do

    it { should have_many(:photos).dependent(:destroy) }
    it { should have_many(:videos).dependent(:destroy) }
  end
end
