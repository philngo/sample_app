class StaticPagesController < ApplicationController
  def home
    @image = current_user.images.create(params[:image]) if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
