require "spec_helper"

describe ArtistsController do

  describe "routing" do

    it "routes to #index" do
      expect(get("/")).to route_to("artists#index")
    end
    it "routes to #new" do
      expect(get("/artists/new")).to route_to("artists#new")
    end
    it "routes to #create" do
      expect(post("/artists")).to route_to("artists#create")
    end
    it "routes to #show" do
      expect(get("/artists/1")).to route_to("artists#show", id: "1")
    end
    it "routes to #edit" do
      expect(get("/artists/1/edit")).to route_to("artists#edit", :id => "1")
    end
    it "routes to #update" do
      expect(patch("/artists/1")).to route_to("artists#update", :id => "1")
    end
    it "routes to #destroy" do
      expect(delete("/artists/1")).to route_to("artists#destroy", :id => "1")
    end
  end

  describe "route helpers" do

    it "root_path" do
      expect(root_path).to eq("/")
    end
    it "new_artist_path" do
      expect(new_artist_path).to eq("/artists/new")
    end
    it "artists_path" do
      expect(artists_path).to eq("/artists")
    end
    it "artist_path" do
      expect(artist_path(1)).to eq("/artists/1")
    end
    it "edit_artist_path" do
      expect(edit_artist_path(1)).to eq("/artists/1/edit")
    end
  end
end
