Given('I entered into the News page {string}') do |title|
  news_page.load(slug: title.parameterize)
end

Then('I should see the news title {string}') do |title|
  expect(news_page).to have_content(title)
end

Then('I should see the order by date {string}') do |date|
  expect(news_page.order_by_date.text).to eq(date)
end

Then('I should see the news content') do |content|
  expect(news_page).to have_content(content)
end

Then('I should see the news call to action links') do |table|
  cta_link = news_page.cta_link

  table.rows.each do |row|
    expect(row[0]).to eq(cta_link.text)
    expect(row[1]).to eq(cta_link['href'])
  end
end
