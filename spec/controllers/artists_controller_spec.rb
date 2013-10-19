require 'spec_helper'

describe ArtistsController do
  let!(:artist) { create(:artist) }

  describe "GET 'index'" do

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
end