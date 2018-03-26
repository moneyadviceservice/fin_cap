class EvidenceHubSearchFormPresenter < BasePresenter
  def translate_field(field)
    object.class.human_attribute_name(field)
  end

  def filter_options(field)
    translate_field(field).map do |option|
      FilterOption.new(option)
    end
  end

  def class_name
    object.class.name.underscore
  end

end
