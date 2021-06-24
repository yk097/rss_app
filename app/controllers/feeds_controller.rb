class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end

  # def index
  #   @search = Item.ransack(params[:q])
  #   @items = @search.result
  # end

  # def search
  #   @items = @q.result(distinct: true)
  # end



end
