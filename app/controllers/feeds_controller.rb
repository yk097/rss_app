class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end

  def search
    @items = Item.where("title LIKE ?", "%#{params[:title]}%")
  end


  # def index
  #   @search = Item.ransack(params[:q])
  #   @items = @search.result
  # end




end
