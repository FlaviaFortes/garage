class ArtistsController < ApplicationController
  before_filter :set_artist, only: [:edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path, notice: "Nice! You're ready to Rock!"
    else
      render 'new'
    end
  end

  def show
   @artist = Artist.find(params[:id])
  end

  def edit
  end

  def update
    if @artist.update_attributes(artist_params)
      redirect_to artist_path(@artist), notice: "Nice! You're ready to Rock!"
    else
      render 'edit'
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path, notice: "Goodbye :("
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

 private
    def artist_params
      params.require(:artist).permit(:name, :email, :description, :site, :avatar, :soundcloud_playlist)
    end
end
