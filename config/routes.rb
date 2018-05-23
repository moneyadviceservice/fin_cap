Rails.application.routes.draw do
  root to: 'homepage#index'

  scope ':locale', locale: /en/ do
    resources :articles, only: :show
    resources :evaluations, only: :show
    resources :evidence_hub, only: :index
    resources :insights, only: :show
    resources :reviews, only: :show
    resources :thematic_reviews, only: :show, path: 'thematic-reviews'
  end

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get "styleguide/:page" => "styleguide#show"
end
