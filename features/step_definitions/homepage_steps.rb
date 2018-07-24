Given('I entered into the Homepage') do
  home_page.load
end

Then('I should see the homepage title {string}') do |title|
  expect(home_page).to have_content(title)
end

Then('I should see the homepage content') do |content|
  expect(home_page.main_content.first).to have_content(content)
end

Then('I should see the horizontal teaser box with') do |table|
  horizontal_teaser = home_page.horizontal_teaser

  table.rows.each do |row|
    expect(row[0]).to eq(horizontal_teaser.title.text)
    expect(horizontal_teaser.content).to have_content(row[1])
    expect(row[2]).to eq(horizontal_teaser.link.text)
    expect(row[3]).to eq(horizontal_teaser.link[:href])
  end
end
