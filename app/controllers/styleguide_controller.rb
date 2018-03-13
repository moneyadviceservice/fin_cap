class StyleguideController < ApplicationController
  before_action :components, :page_specific, :ui_helpers, :links
  layout 'styleguide'
  include StyleguideHelper

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

  STYLEGUIDE_VIEWS = Rails.root.join(
    'app',
    'views',
    'styleguide',
    '*.html.erb'
  )

  STYLEGUIDE_TEMPLATES = Dir[STYLEGUIDE_VIEWS].map do |template|
    File.basename(template, '.html.erb')
  end

  def validate_templates
    render body: nil, status: 404 unless page_params.in?(STYLEGUIDE_TEMPLATES)
  end

  def page_params
    params.require(:page)
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

  def links
    @links = LINKS
  end
end
