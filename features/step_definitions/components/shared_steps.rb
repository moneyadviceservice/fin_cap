Then('I should see the {string} page') do |string|
  expect(current_page.title.text).to eq(string)
end

Then('The {string} meta tag should be present') do |string|
  expect(current_page).to send("have_meta_#{string}")
end
