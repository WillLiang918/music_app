class AlbumsController < ApplicationController

  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  def destroy
  end

  private
    def album_params
      params
      .require(:album)
      .permit(:name, :band_id, :album_type)
    end
end
