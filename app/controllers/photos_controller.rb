class PhotosController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @photos = Photo.where(artist: @artist)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @photo = Photo.new(artist: @artist)
  end
end