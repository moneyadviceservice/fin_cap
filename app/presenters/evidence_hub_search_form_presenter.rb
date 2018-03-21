class EvidenceHubSearchFormPresenter < BasePresenter
  def translate_field(field)
    object.class.human_attribute_name(field)
  end

  def client_group_options
    translate_field(:client_groups)
  end

end
