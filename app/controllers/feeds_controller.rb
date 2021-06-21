class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end
  
  # def search
  #   @items = Item.find_by(title: /^(?=.*word).*$/) 
  # end

end
