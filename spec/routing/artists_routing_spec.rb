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
  end
end
