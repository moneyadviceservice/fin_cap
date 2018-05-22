Given('I visit the evidence hub search page') do
  evidence_summaries_page.load(locale: 'en')
end

Given('I search based on some filters') do
  evidence_summaries_page.older_people_filter.set(true)
  evidence_summaries_page.social_housing_tenants_filter.set(true)
  evidence_summaries_page.children_filter.set(true)
  step %(I press search)
end

Given(
  'I am on the page {string} seeing {string} evidence summary per page'
) do |page, per_page|
  visit("/en/evidence_hub?page=#{page}&per_page=#{per_page}")
end

When('I go to the next evidence hub page') do
  evidence_summaries_page.next_page.click
end

When('I go to the previous evidence hub page') do
  evidence_summaries_page.previous_page.click
end

When('I search the evidence hub with a keyword {string}') do |keyword|
  evidence_summaries_page.keyword.set(keyword)
  step %(I press search)
end

When('I filter the search for the topic Saving') do
  evidence_summaries_page.saving_filter.set(true)
  step %(I press search)
end

When('I press search') do
  evidence_summaries_page.search_button.click
end

When('I want to clear the filters') do
  evidence_summaries_page.clear_filters_button.click
end

Then('I should see {string} evidence summary') do |records_size|
  expect(evidence_summaries_page.search_results.size).to be(records_size.to_i)
end

Then(
  'I should see the {string} evidence summary with data types as'
) do |result_number, table|
  search_result = evidence_summaries_page.search_results.send(result_number)

  table.rows.each do |row|
    data_type_element = search_result.send(row[0])
    data_type_element_class = data_type_element['class']
    icon_class_value = data_type_element_class[/tick|cross/]

    expect(icon_class_value).to eq(row[1])
  end
end

Then('I should see the {string} evidence summary as') do |result_number, table|
  search_result = evidence_summaries_page.search_results.send(result_number)

  table.rows.each do |row|
    field_name = row[0].parameterize.underscore
    expect(search_result.send(field_name)).to have_text(row[1])
  end
end

Then('I should see no filters checked') do
  expect(evidence_summaries_page.older_people_filter.checked?).to be_falsey
end

Then('I should see the keyword field cleared') do
  expect(evidence_summaries_page.keyword.value).to eq('')
end
