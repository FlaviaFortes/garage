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
        should set_the_flash[:notice].to(/sucesso/)
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

      it "should assign post" do
        expect(assigns(:artist)).to eq(artist)
      end
    end

    context "with an invalid param" do

      it "should raise error" do
        expect do
          get :show, id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end