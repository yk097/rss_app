Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "feeds#home"
  get '/search' => 'feeds#search'
  # get '/index' => 'feeds#index'
  # get '/test' => 'feeds#test'
  
end
