Rails.application.routes.draw do
  root to: 'homepage#index'

  scope ':locale', locale: /en/ do
    resources :evidence_hub, only: :index
    resources :insights, only: :show
    resources :evaluations, only: :show
    resources :articles, only: :show
  end

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get "styleguide/:page" => "styleguide#show"
end
