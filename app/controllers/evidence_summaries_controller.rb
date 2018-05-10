class EvidenceSummariesController < ApplicationController
  def show
    @evidence_summary = EvidenceSummary.new(resource)
  end
end
