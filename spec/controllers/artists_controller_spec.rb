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
end