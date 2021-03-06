class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photos = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:title, :caption, :image)
  end

end
