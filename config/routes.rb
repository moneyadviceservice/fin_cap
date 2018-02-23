Rails.application.routes.draw do
  root to: 'homepage#index'

  scope ':locale', locale: /en/ do
    resources :insights, only: :show
  end

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get "styleguide/:page" => "styleguide#show"
end
