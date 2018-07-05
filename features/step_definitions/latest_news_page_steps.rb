Given('I visit the latest news page') do
  latest_news_page.load
end

Then('I should see the latest news main description {string}') do |description|
  expect(latest_news_page.main_description.text).to eq(description)
end

Then('I should see the latest news content') do |content|
  expect(latest_news_page).to have_content(content)
end

Then('I should see a list of all news article titles and dates') do |table|
  expect(latest_news_page.news_items.count).to eq(1)

  table.rows.each do |row|
    expect(latest_news_page.news_items.first.text).to eq("#{row[0]} #{row[1]} Read more")
    expect(latest_news_page.news_items.first.link.text).to eq("Read more")
  end
end

Then('I should see them in order of most recently entered') do |table|
  tr = latest_news_page.thematic_reviews.send(result_number)

  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(tr.send(field_name)).to have_text(row[1])
  end
end

Then('I should see a link to the {string} news item') do |item_number, table|
  link = latest_news_page.news_items.send(item_number).link

  table.rows.each do |row|
    expect(link['href']).to eq(row[0])
  end
end
