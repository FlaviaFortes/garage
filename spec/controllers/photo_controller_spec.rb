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

  describe "GET 'new'" do
    let(:artist) { create(:artist) }
    let(:photo) { create(:photo, artist: artist) }

    context "request" do
      before do
        get :new, artist_id: artist.id
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should render_with_layout(:application) }

      it "assign correct artist" do
        expect(assigns(:artist)).to eq(artist)
      end

      it "assign a new photo" do
        expect(assigns(:photo)).to be_a_new(Photo)
      end
    end
  end
end
