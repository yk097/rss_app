class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end

  def search
    @items = Channel.first.items
  end


  # def index
  #   @search = Item.ransack(params[:q])
  #   @items = @search.result
  # end




end
