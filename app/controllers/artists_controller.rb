class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    # binding.pry
    if @artist.save
      redirect_to artists_path, notice: "Perfil criado com sucesso! Seja bem-vindo ao Garage!"
    else
      render 'new'
    end
  end

  def show
   @artist = Artist.find(params[:id])
  end

 private
    def artist_params
      params.require(:artist).permit(:name, :email, :description, :site, :avatar)
    end
end
