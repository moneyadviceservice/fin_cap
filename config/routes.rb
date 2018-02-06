Rails.application.routes.draw do
  root to: 'homepage#index'

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get "styleguide/:page" => "styleguide#show"
end
