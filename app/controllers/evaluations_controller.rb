class EvaluationsController < EvidenceSummariesController
  def resource
    Mas::Cms::Evaluation.find(params[:id])
  end
end
