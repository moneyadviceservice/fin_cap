Then('I should see the latest news box with {string} news items') do |number|
  expect(current_page.latest_news_item.count).to eq(number.to_i)
end

Then('I should see the news items details') do |table|
  news_items = current_page.latest_news_item

  table.rows.each do |row|
    expect(row[0]).to be_in(news_items.map { |item| item.title.text })
    expect(row[1]).to be_in(news_items.map { |item| item.date.text })
  end
end
