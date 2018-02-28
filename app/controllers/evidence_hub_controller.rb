class EvidenceHubController < ApplicationController
  def index
    @evidence_summaries = EvidenceSummary.map(Mas::Cms::Document.all)
  end
end
