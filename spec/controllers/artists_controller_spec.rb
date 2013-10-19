require 'spec_helper'

describe ArtistsController do

  describe "GET 'index'" do
    let!(:artist) { create(:artist) }

    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should render_with_layout(:application) }

    it "assign all artists" do
      expect(assigns(:artists)).to include(artist)
    end
  end

  describe "GET 'new'" do

    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should render_with_layout(:application) }

    it "should assign a new post" do
      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "POST 'create'" do

    context "with valid params" do

      let(:params) do
        { artist:  attributes_for(:artist) }
      end

      it "create a new artist" do
        expect do
          post :create, params
        end.to change(Artist, :count).by(1)
      end

      it "assign a newly @artist" do
        post :create, params
        expect(assigns(:artist)).to be_a(Artist)
      end

      it "@artist is persisted" do
        post :create, params
        expect(assigns(:artist)).to be_persisted
      end

      it "redirect to the artists_path" do
        post :create, params
        should redirect_to(artists_path)
      end

      it "set the flash correctly" do
        post :create, params
        should set_the_flash[:notice].to("Nice! You're ready to Rock!")
      end
    end

    context "with invalid params" do

      let(:params) do
        { artist:  attributes_for(:artist, name: "") }
      end

      it "does not create a new artist" do
        expect do
          post :create, params
        end.to_not change(Artist, :count)
      end

      it "does not assign @artist with a new one" do
        post :create, params
        expect(assigns(:artist)).to be_a_new(Artist)
      end

      it "re-render the 'new' template" do
          post :create, params
          should render_template("new")
      end
    end
  end

   describe "GET 'show'" do

    context "with a valid param" do
      let!(:artist) { create(:artist) }

      before do
        get :show, id: artist
      end

      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should render_with_layout(:application) }

      it "assign artist" do
        expect(assigns(:artist)).to eq(artist)
      end
    end

    context "with an invalid param" do

      it "raise error" do
        expect do
          get :show, id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "GET 'edit'" do
    let!(:artist) { create(:artist) }

    before do
      get :edit, id: artist
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }
    it { should render_with_layout(:application) }

    it "assign artist" do
      expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "PUT 'update'" do

    context "with valid params" do
      let!(:artist) { create(:artist) }

      let(:params) do
        {
          id: artist,
          artist:  attributes_for(:artist, name: "T Swizzle", description: "Now I'm a rapper! Yo!")
        }
      end

      it "update the artist" do
        expect do
          patch :update, params
        end.to change{ artist.reload.name }.from("Taylor Swift").to("T Swizzle")
      end

      it "assign correct @artist" do
        patch :update, params
        expect(assigns(:artist)).to eq(artist)
      end

      it "redirect to artists_path" do
        patch :update, params
        should redirect_to(artists_path)
      end

      xit "set the flash correctly" do
        patch :update, params
        should set_the_flash[:notice].to("Nice! You're ready to Rock!")
      end
    end

    context "with invalid params" do
      let!(:artist) { create(:artist) }

      let(:params) do
        {
          id: artist,
          artist:  attributes_for(:artist, name: "")
        }
      end

      it "does not update the artist" do
        expect do
          patch :update, params
        end.to_not change{ artist.name }
      end

      it "assign correct @artist" do
        patch :update, params
        expect(assigns(:artist)).to eq(artist)
      end

      it "re-render the 'edit' template" do
        patch :update, params
        should render_template("edit")
      end
    end
  end

  describe "DELETE 'destroy'" do
    let!(:artist) { create(:artist) }

    context "with a valid param" do

      it "destroy the artist" do
        expect do
          delete :destroy, id: artist
        end.to change(Artist, :count).by(-1)
      end

      it "redirect to artist_path" do
        delete :destroy, id: artist
        should redirect_to(artists_path)
      end

      it "set the flash correctly" do
        delete :destroy, id: artist
        should set_the_flash[:notice].to("Goodbye :(")
      end
    end

    context "with an invalid param" do

      it "raise error" do
        expect do
          delete :destroy, id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end