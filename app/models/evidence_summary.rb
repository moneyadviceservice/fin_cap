class EvidenceSummary
  extend ActiveModel::Translation

  IS_NEW_PERIOD = 90

  def self.map(documents)
    documents.map { |document| new(document) }
  end

  attr_reader :document
  delegate :blocks,
           :layout_identifier,
           :label,
           :full_path,
           to: :document
  alias title label

  def initialize(document)
    @document = document
  end

  def content
    find_block(:content)
  end

  def client_group
    find_blocks(:client_groups)
  end

  def topics
    find_blocks(:topics)
  end

  def measured_outcomes
    find_blocks(:measured_outcomes)
  end

  def programme_delivery
    find_block(:programme_delivery)
  end

  def evidence_type
    layout_identifier.to_s.capitalize
  end

  def overview
    find_block(:overview)
  end

  def activities_and_setting
    find_block(:activities_and_setting)
  end

  def countries
    find_block(:countries)
  end

  def year_of_publication
    find_block(:year_of_publication)
  end

  def links_to_research
    find_block(:links_to_research)
  end

  def contact_information
    find_block(:contact_information)
  end

  def data_types
    find_blocks(:data_types)
  end

  def recent?
    created_at.present? && created_at > (Time.current - IS_NEW_PERIOD.days)
  end

  private

  def find_blocks(block_identifier)
    find_block(block_identifier, find_method: :select)
  end

  def find_block(block_identifier, find_method: :find)
    fields = blocks.method(find_method).call do |block|
      block['identifier'] == block_identifier.to_s
    end

    retrieve_content(fields)
  end

  def retrieve_content(fields)
    return fields.to_s if fields.nil?

    if fields.is_a?(Array)
      fields.map { |field| field['content'] }
    else
      fields['content']
    end
  end

  def created_at
    blocks.find(:content).first&.fetch('created_at', nil)
  end
end
