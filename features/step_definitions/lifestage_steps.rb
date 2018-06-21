Given('I entered into the Lifestage page {string}') do |title|
  lifestage_page.load(slug: title.parameterize)
end

Then('I should see the lifestage title {string}') do |title|
  expect(lifestage_page).to have_content(title)
end

Then('I should see the lifestage description') do |description|
  expect(lifestage_page.main_description).to have_content(description)
end

Then('I should see the lifestage content') do |content|
  expect(lifestage_page).to have_content(content)
end

Then('I should see the latest news box') do
  expect(lifestage_page).to have_latest_news
end

Then('I should see the teaser boxes with') do |table|
  teasers = lifestage_page.teaser_boxes

  table.rows.each do |row|
    expect(row[0]).to be_in(teasers.map { |teaser| teaser.image['src'].chomp! })
    expect(row[1]).to be_in(teasers.map { |teaser| teaser.title.text })
    expect(row[2]).to be_in(teasers.map { |teaser| teaser.content.text })
    expect(row[3]).to be_in(teasers.map { |teaser| teaser.link['href'] })
  end
end

Then('I should see the research box') do
  expect(lifestage_page).to have_content('Research & Evaluation')
end

Then('I should see the strategy box with') do |table|
  strategy_box = lifestage_page.strategy_box

  table.rows.each do |row|
    expect(row[0]).to eq(strategy_box.title.text)
    expect(strategy_box.content).to have_content(row[1])
    expect(row[2]).to eq(strategy_box.link['href'])
  end
end

Then('I should see the lifestages box') do
  expect(lifestage_page).to have_content('Life stages across the UK')
end

Then('I should see the steering group links') do |table|
  links = lifestage_page.steering_group_links

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

