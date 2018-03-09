class InsightsController < ApplicationController
  def show
    document = Mas::Cms::Insight.find(params[:id])
    @evidence_summary = EvidenceSummary.new(document)
  end
end
