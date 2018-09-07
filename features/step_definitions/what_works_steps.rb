Given('I entered into the What Works page {string}') do |title|
  what_works_page.load(slug: title.parameterize)
end

Then('I should see the What Works title {string}') do |title|
  expect(what_works_page).to have_content(title)
end

Then('I should see the What Works content') do |content|
  expect(what_works_page.main_content.first).to have_content(content)
end
