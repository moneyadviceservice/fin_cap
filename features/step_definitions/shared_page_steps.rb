Then('I should see the hero description {string}') do |description|
  expect(current_page.hero_description.text).to eq(description)
end

Then('I should see the news items details') do |table|
  news_items = current_page.latest_news_item

  table.rows.each do |row|
    expect(row[0]).to be_in(news_items.map { |item| item.title.text })
    expect(row[1]).to be_in(news_items.map { |item| item.date.text })
    expect(row[2]).to be_in(news_items.map { |item| item.link['href'] })
  end
end
