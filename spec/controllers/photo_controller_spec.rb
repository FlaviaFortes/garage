require 'spec_helper'

describe PhotosController do

  describe "GET 'index'" do
    let(:artist) { create(:artist) }
    let(:photo) { create(:photo, artist: artist) }

    before do
      get :index, artist_id: artist.id
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should render_with_layout(:application) }

    it "assign correct artist" do
      expect(assigns(:artist)).to eq(artist)
    end

    it "assign correct photos" do
      expect(assigns(:photos)).to include(photo)
    end
  end
end