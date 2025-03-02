class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
  end

  def create
    @genre = Genre.new(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  def show
    @genre = Genre.find(params[:id])
    @songs = @genre.songs
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
