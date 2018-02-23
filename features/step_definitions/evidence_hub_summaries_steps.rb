Given("I entered into the Insight page {string}") do |title|
  evidence_hub_summary_page.load(page_type: 'insights', slug: title.parameterize)
end

Then("I should see the content") do |table|
  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(evidence_hub_summary_page.send(field_name).text).to include(row[1])
  end
end
