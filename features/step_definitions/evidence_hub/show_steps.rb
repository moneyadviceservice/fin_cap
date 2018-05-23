Given('I entered into the {string} page {string}') do |page_type, title|
  evidence_summary_page.load(
    page_type: page_type.parameterize.pluralize,
    slug: title.parameterize
  )
end

Given('I entered into the Thematic review page {string}') do |title|
  thematic_review_page.load(
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

Then('I should see the evidence summary data_types') do |table|
  table.rows.each do |row|
    data_type_element = evidence_summary_page.send(row[0])
    data_type_element_class = data_type_element['class']
    icon_class_value = data_type_element_class[/tick|cross/]

    expect(icon_class_value).to eq(row[1])
  end
end
