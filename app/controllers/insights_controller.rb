class InsightsController < ApplicationController
  def show
    @insight = Mas::Cms::Insight.find(params[:id])
  end
end
