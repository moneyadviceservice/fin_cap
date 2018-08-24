Given('I entered a page which includes the countries component') do
  step %(I entered into the Homepage)
end

When('I click on {string} in the countries component') do |country|
  country = current_page.country_rows.select do |row|
    row.text.include?(country)
  end.first

  country.link.click
end

Then('I should see each country with a link to its page') do |table|
  countries = current_page.country_rows
  expect(countries.count).to eq(4)
  
  table.rows.each do |row|
    expect(row[0]).to be_in(countries.map(&:text))
    expect(row[1]).to be_in(countries.map { |ls| ls.link[:href] })
  end
end
