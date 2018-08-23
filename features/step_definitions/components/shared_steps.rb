Then('I should see the {string} page') do |string|
  expect(current_page.title.text).to eq(string)
end
