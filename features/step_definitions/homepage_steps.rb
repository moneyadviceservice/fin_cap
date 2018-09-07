Given('I entered into the Homepage') do
  home_page.load
end

When('I click the {string} cta') do |link_text|
  click_link(link_text)
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

Then('I should see the call to action buttons') do |table|
  ctas = home_page.ctas

  table.rows.each do |row|
    expect(row[0]).to be_in ctas.map(&:text)
    expect(row[1]).to be_in ctas.map { |cta| cta.link[:href] }
  end
end

Then('I should see the stay in touch box') do |table|
  stay_in_touch_box = home_page.stay_in_touch_box

  table.rows.each do |row|
    expect(row[0]).to eq(stay_in_touch_box.title.text)
    expect(row[1]).to eq(stay_in_touch_box.content.text)
    expect(row[2]).to eq(stay_in_touch_box.link['href'])
  end
end

Then('I should see the {string} article') do |slug|
  steps %(
    I entered into the Article page {slug}
  )
end
