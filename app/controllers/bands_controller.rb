class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    band = Band.find(params[:id])
    Band.delete(params[:id])
    flash[:errors] = ["#{band.name} has been deleted"]
    redirect_to new_band_url
  end

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
