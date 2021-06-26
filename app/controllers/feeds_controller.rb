class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end

  def search
    if params[:title].empty?
      redirect_to root_path
    else
      @items = Item.where("title LIKE ?", "%#{params[:title]}%")
    end
  end


  # def index
  #   @search = Item.ransack(params[:q])
  #   @items = @search.result
  # end




end
