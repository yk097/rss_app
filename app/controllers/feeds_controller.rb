class FeedsController < ApplicationController
  
  def home
    @channels = Channel.all
  end
  
end
