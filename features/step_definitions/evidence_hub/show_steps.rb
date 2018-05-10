Given('I entered into the {string} page {string}') do |page_type, title|
  evidence_summary_page.load(
    page_type: page_type.parameterize.pluralize,
    slug: title.parameterize
  )
end

Then('I should see the evidence summary content') do |table|
  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    content = evidence_summary_page.send(field_name).text

    expect(content).to include(row[1])
  end
end
