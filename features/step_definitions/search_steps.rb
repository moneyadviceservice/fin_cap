When('I search the query {string} on top bar') do |query|
  home_page.top_search_box.input.set(query)
  home_page.top_search_box.submit.click
end

When('I search the query {string} on bottom bar') do |query|
  home_page.bottom_search_box.input.set(query)
  home_page.bottom_search_box.submit.click
end

Then('I should see the search results') do |table|
  step %(I should be on the search results page)

  table.rows.each do |row|
    expect(page).to have_content(row[0])
  end
end

Then('I should be on the search results page') do
  expect(page.current_path).to eq('/en/search')
end

Then('I should see {string} results') do |results_size|
  expect(search_results_page.results.size).to be(results_size.to_i)
end

Then(
  'I should be on page {string} of {string} of the search results'
) do |page, number_of_pages|
  expect(
    search_results_page.pagination.text
  ).to include("Page #{page} of #{number_of_pages}")
end

Then('I should not see the {string} button') do |type|
  expect(search_results_page).not_to have_content("#{type}_button")
end

Then('I click on the {string} button') do |type|
  search_results_page.pagination.send("#{type}_button").click
end

Then('I should see no search results for {string}') do |query|
  expect(search_results_page).to have_no_results
end

Then('I should see the description') do |table|
  table.rows.each do |row|
    expect(page).to have_content(row[1])
  end
end

