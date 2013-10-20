class PhotosController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @photos = Photo.where(artist: @artist)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @photo = Photo.new(artist: @artist)
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @photo = @artist.photos.new(photo_params)
    if @photo.save
      redirect_to artist_path(@artist)
    else
      render 'new'
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :description)
    end
end