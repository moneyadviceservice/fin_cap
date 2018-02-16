class StyleguideController < ApplicationController
  before_action :components, :links
  layout 'styleguide'
  include StyleguideHelper

  def show
    if params[:page] == 'colours'
      @primary_colours    = PRIMARY_COLOURS
      @supporting_colours = SUPPORTING_COLOURS
      @mono_colours       = MONO_COLOURS
      @greys              = GREYS
    end

    render params[:page]
  end

  private

  def components
    @components = COMPONENTS
  end

  def links
    @links = LINKS
  end
end
