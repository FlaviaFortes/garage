class PhotosController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @photos = Photo.where(artist: @artist)
  end
end