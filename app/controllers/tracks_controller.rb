class TracksController < ApplicationController

  def new
    fail
    @track = Track.new
    render :new
  end

  def edit

  end

  def show
  end

  def destroy
  end
end
