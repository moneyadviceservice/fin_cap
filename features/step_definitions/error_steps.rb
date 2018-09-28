Given('I entered a page that does not exist') do
  visit '/dadf'
end

Given('I should see the error content') do |string|
  expect(current_page).to have_content(string)
end

Given('I should see the fincap logo linking to the homepage') do
  save_and_open_page
  expect(current_page).to have_logo_link
end
