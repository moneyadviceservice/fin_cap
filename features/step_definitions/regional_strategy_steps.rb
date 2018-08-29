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
