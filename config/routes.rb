Rails.application.routes.draw do
  root to: 'homepage#index'

  scope ':locale', locale: /en/ do
    resources :evidence_hub, only: :index
  end

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get "styleguide/:page" => "styleguide#show"
end
