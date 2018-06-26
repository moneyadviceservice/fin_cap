class StyleguideController < ApplicationController
  before_action :components, :page_specific, :ui_helpers
  before_action :links, :partials, :non_base_items

  layout 'styleguide'
  include StyleguideHelper
  STYLEGUIDE_VIEWS = Rails.root.join(
    'app',
    'views',
    'styleguide',
    '*.html.erb'
  )
  STYLEGUIDE_TEMPLATES = Dir[STYLEGUIDE_VIEWS].map do |template|
    File.basename(template, '.html.erb')
  end

  before_action :validate_templates, only: :show

  def show
    if page_params == 'colours'
      @primary_colours    = PRIMARY_COLOURS
      @supporting_colours = SUPPORTING_COLOURS
      @mono_colours       = MONO_COLOURS
      @greys              = GREYS
    end

    @primary_colours = PRIMARY_COLOURS if page_params == 'buttons'

    render page_params
  end

  private

  def validate_templates
    return if page_params.in?(STYLEGUIDE_TEMPLATES)

    render body: nil, status: :not_found
  end

  def page_params
    params.require(:page)
  end

  def non_base_items
    @non_base_items = NON_BASE_ITEMS
  end

  def components
    @components = COMPONENTS
  end

  def page_specific
    @page_specific = PAGE_SPECIFIC
  end

  def ui_helpers
    @ui_helpers = UI_HELPERS
  end

  def partials
    @partials = PARTIALS
  end

  def links
    @links = LINKS
  end
end
