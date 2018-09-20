Given('I entered into the Impact Principles page') do
  impact_principles_page.load
end

Then('I should see the impact_principles title {string}') do |title|
  expect(impact_principles_page).to have_content(title)
end

Then('I should see the call to action links') do |table|
  call_to_action_links = impact_principles_page.call_to_action_box.map(&:link)

  table.rows.each do |row|
    expect(row[0]).to be_in(call_to_action_links.map(&:text))
    expect(row[1]).to be_in(call_to_action_links.map { |link| link[:href] })
  end
end
