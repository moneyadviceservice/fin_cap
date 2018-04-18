Given('I visit the evidence hub search page') do
  evidence_summaries_page.load(locale: 'en')
end

When('I search the evidence hub for the keyword {string}') do |keyword|
  evidence_summaries_page.keyword.set(keyword)
  step %{I press search}
end

When('I filter the search for the topic Saving') do
  evidence_summaries_page.saving_filter.set(true)
  step %{I press search}
end

When('I press search') do
  evidence_summaries_page.search_button.click
end

Then('I should see {string} evidence summary') do |records_size|
  expect(evidence_summaries_page.search_results.size).to be(records_size.to_i)
end

Then('I should see the {string} evidence summary as') do |result_number, table|
  search_result = evidence_summaries_page.search_results.send(result_number)

  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(search_result.send(field_name)).to have_text(row[1])
  end
end
