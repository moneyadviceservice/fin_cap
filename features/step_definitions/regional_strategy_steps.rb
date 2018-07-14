Given('I entered into the Regional Strategy page {string}') do |title|
  regional_strategy_page.load(slug: title.parameterize)
end

Then('I should see the regional strategy title {string}') do |title|
  expect(regional_strategy_page).to have_content(title)
end

Then('I should see the regional strategy description') do |description|
  expect(regional_strategy_page.main_description).to have_content(description)
end

Then('I should see the regional strategy content') do |content|
  expect(regional_strategy_page).to have_content(content)
end

Then('I should see the latest news box') do
  expect(regional_strategy_page).to have_latest_news
end

Then('I should see the teaser boxes with') do |table|
  teasers = regional_strategy_page.teaser_boxes

  table.rows.each do |row|
    expect(row[0]).to be_in(teasers.map { |teaser| teaser.title.text })
    expect(row[1]).to be_in(teasers.map { |teaser| teaser.content.text })
    expect(row[2]).to be_in(teasers.map { |teaser| teaser.link['href'] })
  end
end

Then('I should see the research box') do
  expect(regional_strategy_page).to have_content('Research and findings')
  expect(regional_strategy_page).to have_content('Evaluate your programme')
end

Then('I should see the strategy box with') do |table|
  strategy_box = regional_strategy_page.supplementary_info_box.first

  table.rows.each do |row|
    expect(row[0]).to eq(strategy_box.title.text)
    expect(strategy_box.content).to have_content(row[1])
    expect(row[2]).to be_in(strategy_box.links.map { |link| link[:href] })
  end
end

Then('I should see the lifestages box') do
  expect(lifestage_page).to have_content('Life stages across the UK')
end

Then('I should see the steering group links') do |table|
  links = lifestage_page.supplementary_info_box.last.links

  table.rows.each do |row|
    expect(row[0]).to be_in(links.map(&:text))
    expect(row[1]).to be_in(links.map { |link| link[:href] })
  end
end

Then('I should see the lifestage download links') do |table|
  download_box_links = lifestage_page.download_box.map(&:link)

  table.rows.each do |row|
    expect(row[0]).to be_in(download_box_links.map(&:text))
    expect(row[1]).to be_in(download_box_links.map { |link| link[:href] })
  end
end
