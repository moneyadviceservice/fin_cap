When('I visit the evidence hub search page') do
  evidence_summaries_page.load(locale: 'en')
end

Then('I should see the {string} result as') do |result_number, table|
  search_result = evidence_summaries_page.search_results.send(result_number)

  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(search_result.send(field_name)).to have_text(row[1])
  end
end
