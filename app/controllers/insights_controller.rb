class InsightsController < EvidenceSummariesController
  def resource
    Mas::Cms::Insight.find(params[:id])
  end
end
