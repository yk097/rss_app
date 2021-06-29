class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end

  def search
    if params[:title].empty?
      redirect_to root_path
    else
      @all = Item.where("title LIKE ?", "%#{params[:title]}%")
      @feeds = @all.page(params[:page]).per(10)
    end
  end


  # def index
  #   @search = Item.ransack(params[:q])
  #   @items = @search.result
  # end




end
