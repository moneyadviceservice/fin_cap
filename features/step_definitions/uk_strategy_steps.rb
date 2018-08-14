Given('I entered into the UK Strategy page {string}') do |title|
  uk_strategy_page.load(slug: title.parameterize)
end

Then('I should see the UK Strategy title {string}') do |title|
  expect(uk_strategy_page).to have_content(title)
end

Then('I should see the UK Strategy description') do |description|
  expect(uk_strategy_page).to have_content(description)
end

Then('I should see the UK Strategy content') do |content|
  expect(uk_strategy_page).to have_content(content)
end
