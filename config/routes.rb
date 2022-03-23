Rails.application.routes.draw do
  get 'country_statistics/index'
  get '/country_statistics', to: "country_statistics#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
