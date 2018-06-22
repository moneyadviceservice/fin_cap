class NewsTemplate < BaseTemplate
  ORDER_BY_DATE_IDENTIFIER = 'order_by_date'.freeze

  def order_by_date_block
    find_block(ORDER_BY_DATE_IDENTIFIER)
  end
end
