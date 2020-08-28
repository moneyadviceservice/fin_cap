require 'yaml'

Rails.application.routes.draw do
  root to: 'homepages#show', locale: 'en'

  #perform the redirects
  redirects = YAML.load_file('config/redirects.yml')
  redirects.each do |rule|
    get rule["old_path"], to: redirect(rule["new_path"], status: 301)
  end

  CMS_PAGES = %w[
    articles
    evaluations
    insights
    latest_news
    news
    reviews
  ].freeze

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
    resources :uk_strategies, only: :show
    resources :what_works, only: :show

    # Static pages
    get 'get-involved' => 'static_pages#be_involved'
    get 'impact-principles' => 'static_pages#impact_principles'

    # Preview pages
    get '/:page_type/:id/preview' => 'documents_preview#show',
        page_type: Regexp.union(CMS_PAGES)

    # Search page
    resources :search_results, only: 'index', path: 'search'
  end

  resources :cookie_policy_acceptances, only: :create

  # Styleguide
  get '/styleguide', to: 'styleguide#home'
  get 'styleguide/:page' => 'styleguide#show'

  # Errors
  get 'not_found', to: 'errors#not_found'
  get 'service_unavailable', to: 'errors#service_unavailable'

  get '*path', to: 'catch_all#index'
end
