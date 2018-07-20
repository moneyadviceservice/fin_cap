Then('I should see the latest news box with {string} news items') do |number|
  expect(current_page.latest_news_item.count).to eq(number.to_i)
end
