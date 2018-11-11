class ArtistsController < ApplicationController


  def index
    # if Admin::Preference.established?
    #   @artists = Artist.order(name: Admin::Preference.first.artist_sort_order)
    # else
    #   @artists = Artist.order(:name)
    # end
    begin 
      @artists = Artist.order(name: Admin::Preference.first.artist_sort_order)
    rescue NoMethodError => e
      @artists = Artist.order(:name)
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    if Admin::Preference.established?
      redirect_to artists_path if not Admin::Preference.first.allow_create_artists
      @artist = Artist.new
    else
      @artist = Artist.new
    end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
