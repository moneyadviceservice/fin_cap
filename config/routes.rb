Rails.application.routes.draw do
  root to: 'homepage#index'

  scope ':locale', locale: /en/ do
    resources :articles, only: :show
    resources :evaluations, only: :show
    resources :evidence_hub, only: :index
    resources :insights, only: :show
    resources :lifestages, only: :show
    resources :news, only: %i[index show]
    resources :regional_strategies, only: %i[show]
    resources :reviews, only: :show
    resources :thematic_reviews, only: %i[index show]

    # rubocop:disable Metrics/LineLength
    get '/:page_type/:id/preview' => 'documents_preview#show',
        page_type: /articles|evaluations|insights|reviews|thematic_reviews|thematic_reviews_landing_pages/
    # rubocop:enable Metrics/LineLength

    get 'get-involved' => 'static_pages#be_involved'
  end

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get 'styleguide/:page' => 'styleguide#show'
end
