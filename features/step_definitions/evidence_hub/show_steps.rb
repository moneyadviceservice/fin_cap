Given('I entered into the Insight page {string}') do |title|
  evidence_summary_page.load(page_type: 'insights', slug: title.parameterize)
end

Then('I should see the evidence summary content') do |table|
  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    content = evidence_summary_page.send(field_name).text

    expect(content).to include(row[1])
  end
end

Then('I should see the evidence summary data_types') do |table|
  icon_classes = {
    'tick' => 'evidence-types__item-icon--tick',
    'cross' => 'evidence-types__item-icon--cross'
  }

  table.rows.each do |row|
    field_name = row[0]
    icon = row[1]
    data_type_field = evidence_summary_page.send(field_name)

    expect(data_type_field['class']).to include(icon_classes[icon])
  end
end
