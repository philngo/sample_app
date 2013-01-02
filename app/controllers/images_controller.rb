class ImagesController < ApplicationController
  before_filter :signed_in_user

  def create
    @image = current_user.images.build(params[:image])
    if @image.save
        flash[:success] = "Image saved!"
        redirect_to root_url
    else
        render 'static_pages/home'
    end
  end

  def destroy
  end

end
