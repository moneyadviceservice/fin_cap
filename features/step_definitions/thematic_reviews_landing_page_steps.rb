Given("I visit the thematic reviews landing page") do
  thematic_reviews_landing_page.load
end

Then("I should see the thematic reviews landing page content") do
  expect(thematic_reviews_landing_page.heading)
    .to have_content('Thematic Reviews')
end

Then('I should see the {string} thematic review as') do |result_number, table|
  tr = thematic_reviews_landing_page.thematic_reviews.send(result_number)

  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(tr.send(field_name)).to have_text(row[1])
  end
end

Then("I should see the {string} thematic review link") do |result_number|
  tr = thematic_reviews_landing_page.thematic_reviews.send(result_number)
  title_link = tr.title.text.parameterize
  expect(tr.title['href']).to eq("/en/thematic_reviews/#{title_link}")
end
