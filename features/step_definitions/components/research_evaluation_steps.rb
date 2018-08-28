 Given('I entered a page which includes the R&E component') do
  step %(I entered into the Lifestage page "Young Adults")
end

Then('I should see {string} links for {string}') do |number, title, table|
  items = current_page.find_box(title).research_rows

  expect(items.count).to eq(number.to_i)

  table.rows.each do |row|
    expect(row[0]).to be_in(items.map(&:text))
    expect(row[1]).to be_in(items.map { |item| item.link[:href] })
  end
end
