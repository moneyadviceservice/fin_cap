Given('I entered a page that does not exist') do
  visit '/dadf'
end

Then('I should see the error content') do |string|
  expect(not_found_page).to have_content(string)
end

Then('I should see the fincap logo linking to the homepage') do
  expect(not_found_page).to have_logo_link
end
