class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @photo = Photo.create(photo_params)
    foo
    if @photo.valid?
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
