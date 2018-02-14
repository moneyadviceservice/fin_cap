class StyleguideController < ApplicationController
  layout 'styleguide'

  def show
    render params[:page]
  end
end
