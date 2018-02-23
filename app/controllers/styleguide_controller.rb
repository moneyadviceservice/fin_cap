class StyleguideController < ApplicationController
  before_action :components, :page_specific, :links
  layout 'styleguide'
  include StyleguideHelper

  def show
    if params[:page] == 'colours'
      @primary_colours    = PRIMARY_COLOURS
      @supporting_colours = SUPPORTING_COLOURS
      @mono_colours       = MONO_COLOURS
      @greys              = GREYS
    end

    if params[:page] == 'buttons'
      @primary_colours    = PRIMARY_COLOURS
    end

    render params[:page]
  end

  private

  def components
    @components = COMPONENTS
  end

  def page_specific
    @page_specific = PAGE_SPECIFIC
  end

  def links
    @links = LINKS
  end
end
