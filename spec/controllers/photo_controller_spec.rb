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

    context "with valid artist_id" do
      before do
        get :new, artist_id: artist.id
      end

      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should render_with_layout(:application) }

      it "assign a new photo" do
        expect(assigns(:photo)).to be_a_new(Photo)
      end
    end

    context "with invalid artist_id" do

      it "should raise error" do
        expect do
          get :new, artist_id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "POST 'create'" do
    let(:artist) { create(:artist) }

    context "with valid artist_id" do

      let(:params) do
        { photo:  attributes_for(:photo),
          artist_id: artist.id }
      end

      it "create a new photo" do
        expect do
          post :create, params
        end.to change(Photo, :count).by(1)
      end

      it "assign a newly @photo" do
        post :create, params
        expect(assigns(:photo)).to be_a(Photo)
      end

      it "@photo is persisted" do
        post :create, params
        expect(assigns(:photo)).to be_persisted
      end

      it "create a photo for the right artist" do
        expect do
          post :create, params
        end.to change{ artist.photos.count }.by(1)
      end

      it "redirect to the artist_path" do
        post :create, params
        should redirect_to(artist_path(artist))
      end
    end

    #TODO Create Tests For Invalid Params (image = nil)

    context "with invalid artist id" do

      it "should raise error" do
        expect do
          post :create, artist_id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
