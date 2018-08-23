Given('I entered a page which includes the lifestage component') do
  step %(I entered into the Homepage)
end

When('I click on {string} in the lifestage component') do |lifestage|
  lifestage_link = current_page.lifestage_rows.select do |row|
    row.text == lifestage
  end.first.link

  lifestage_link.click
end

Then('I should see each lifestage with a link to its page') do |table|
  lifestages = current_page.lifestage_rows

  expect(lifestages.count).to eq(7)
  table.rows.each do |row|
    expect(row[0]).to be_in(lifestages.map(&:text))
    expect(row[1]).to be_in(lifestages.map { |ls| ls.link[:href] })
  end
end
