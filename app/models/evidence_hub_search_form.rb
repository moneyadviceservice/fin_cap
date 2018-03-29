class EvidenceHubSearchForm
  include ActiveModel::Model

  attr_accessor :keyword, :document_type, :evidence_types, :client_groups
  attr_accessor :countries_of_delivery, :topics, :years_of_publication

  def choosed_option?(option, field)
    Array(send(field)).include?(option)
  end

  def class_name
    self.class.name.underscore
  end
end
