require "spec_helper"

describe ArtistsController do

  describe "routing" do
    it "routes to #index" do
      expect(get("/artists/1/photos")).to route_to("photos#index", artist_id: "1")
    end
    it "routes to #new" do
      expect(get("/artists/1/photos/new")).to route_to("photos#new", artist_id: "1")
    end
    it "routes to #create" do
      expect(post("/artists/1/photos")).to route_to("photos#create", artist_id: "1")
    end
    it "routes to #destroy" do
      expect(delete("/artists/1/photos/2")).to route_to("photos#destroy", artist_id: "1", id:"2")
    end
  end

  describe "route helpers" do

    it "artist_photos_path" do
      expect(artist_photos_path(1)).to eq("/artists/1/photos")
    end
    it "new_artist_photo_path" do
      expect(new_artist_photo_path(1)).to eq("/artists/1/photos/new")
    end
  end
end
