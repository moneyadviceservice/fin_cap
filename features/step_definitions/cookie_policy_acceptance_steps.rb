Given('I have not previously accepted the cookie policy') do
  page.driver.browser.clear_cookies
end

Given('I have previously accepted the cookie policy') do
  step 'I visit the homepage'
  step 'I accept the cookie policy'
end

When('I accept the cookie policy') do
  current_page.cookie_policy_header.close_button.click
end

Then('I should see the cookie policy header') do |table|
  cookie_policy_header = current_page.cookie_policy_header

  table.rows.each do |row|
    expect(cookie_policy_header.send(row[0])).to eq(row[1])
  end
end

Then('I should not see the cookie policy header') do
  expect(current_page).not_to have_cookie_policy_header
end
