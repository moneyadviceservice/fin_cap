Given('I visit the homepage') do
  home_page.load
end

Given('I visit the page {string}') do |path|
  visit(path)
end

Then('I should be reading the page {string}') do |path|
  expect(page.current_path).to eq(path)
end

Then('I should see the page not found') do
  expect(current_page.status_code).to be(404)
end

Then('I should see the hero description {string}') do |description|
  expect(current_page.hero_description.text).to eq(description)
end

Then('I should see the download links') do |table|
  download_box_links = current_page.download_box.map(&:link)

  table.rows.each do |row|
    expect(row[0]).to be_in(download_box_links.map(&:text))
    expect(row[1]).to be_in(download_box_links.map { |link| link[:href] })
  end
end

Then('I should see the research box') do
  expect(current_page).to have_content('Research and findings')
  expect(current_page).to have_content('Evaluate your programme')
end

Then('I should see the strategy box with') do |table|
  strategy_box = current_page.supplementary_info_box.first
  table.rows.each do |row|
    expect(row[0]).to eq(strategy_box.title.text)
    expect(strategy_box.content).to have_content(row[1])
    expect(row[2]).to be_in(strategy_box.links.map { |link| link[:href] })
  end
end

Then('I should see the teaser boxes with') do |table|
  teasers = current_page.teaser_boxes

  table.rows.each do |row|
    expect(row[0]).to be_in(teasers.map { |teaser| teaser.title.text })
    expect(row[1]).to be_in(teasers.map { |teaser| teaser.content.text })
    expect(row[2]).to be_in(teasers.map { |teaser| teaser.link['href'] })
  end
end

Then('I should see the life stages box') do
  expect(current_page).to have_content('Life stages across the UK')
end

Then('I should see the latest news box') do
  expect(current_page).to have_latest_news_item
end

Then('I should see the countries box') do
  expect(current_page).to have_content('The Strategy across the UK')
  expect(current_page).to have_country_list
end

Then('I should see the steering group links') do |table|
  links = current_page.supplementary_info_box.last.links

  table.rows.each do |row|
    expect(row[0]).to be_in(links.map(&:text))
    expect(row[1]).to be_in(links.map { |link| link[:href] })
  end
end
