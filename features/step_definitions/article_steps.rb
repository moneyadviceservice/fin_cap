Given('I entered into the Article page {string}') do |title|
  article_page.load(slug: title.parameterize)
end

Then('I should see the article title {string}') do |title|
  expect(article_page).to have_content(title)
end

Then('I should see the article content') do |content|
  expect(article_page).to have_content(content)
end

Then('I should see the download box containing the links') do |table|
  download_box_links = article_page.download_box.map(&:link)

  table.rows.each do |row|
    expect(row[0]).to be_in(download_box_links.map(&:text))
    expect(row[1]).to be_in(download_box_links.map { |link| link[:href] })
  end
end
