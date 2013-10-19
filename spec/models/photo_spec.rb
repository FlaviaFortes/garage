require 'spec_helper'

describe Photo do

  describe "associations" do
    it { should belong_to(:artist) }
  end  

  describe "paperclip" do

    describe "image" do

      it { should have_attached_file(:image) }
      it { should validate_attachment_presence(:image) }
      it { should validate_attachment_content_type(:image).
                      allowing('image/png', 'image/gif', 'image/jpg').
                      rejecting('text/plain', 'text/xml') }
    end
  end
end
