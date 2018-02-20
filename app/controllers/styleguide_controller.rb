class StyleguideController < ApplicationController
  before_action :components, :links
  layout 'styleguide'

  def show
    render params[:page]
  end

  private

  def components
    @components = {
      'Teaser box' => 'teaser',
      'Hero image' => 'hero',
      'Bordered box' => 'borderedbox',
      'Latest news' => 'latestnews',
      'Download box' => 'downloads',
      'Feedback' => 'feedback',
      'Large call to action' => 'largecta',
      'Side panel' => 'sidepanel'
    }
  end

  def links
    @links = %w[Layout Typography Links Lists Colours]
  end
end
