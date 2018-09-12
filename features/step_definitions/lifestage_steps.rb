Given('I entered into the Lifestage page {string}') do |title|
  lifestage_page.load(slug: title.parameterize)
end

Then('I should see the lifestage title {string}') do |title|
  expect(lifestage_page).to have_content(title)
end

Then('I should see the lifestage content') do |content|
  expect(lifestage_page.main_content.first).to have_content(content)
end
