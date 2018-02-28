class EvidenceHubController < ApplicationController
  def index
    @documents = Mas::Cms::Document.all
  end
end
