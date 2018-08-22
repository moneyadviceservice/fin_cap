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

When('I search the evidence hub for summaries published in the last 2 years') do
  step %(I visit the evidence hub search page)
  evidence_summaries_page.last_2_years_filter.set(true)
  step %(I press search)
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
  'I should see the {string} evidence summary icon linking to {string} article'
) do |result_number, evidence_type|
  search_result = evidence_summaries_page.search_results.send(result_number)
  path = "/en/articles/evidence-type-#{evidence_type.downcase}"

  expect(search_result).to have_info_icon
  expect(search_result.info_icon[:href]).to eq(path)
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

Then("I should see the {string} {string} filter checked") do |filter_group, value|
  filter_fieldset = evidence_summaries_page.find_filter_group(filter_group)

  filter = filter_fieldset.find_filter(value)

  expect(filter.input).to be_checked
end

Then('I should see the keyword field cleared') do
  expect(evidence_summaries_page.keyword.value).to eq('')
end

# rubocop:disable Metrics/LineLength
Then('I should see the summaries related to {string}') do |_|
  steps %(
    Then I should see "2" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                    |
      | document title      | Looking after the pennies                                |
      | overview            | An evaluation, commissioned by Royal London              |
      | evidence type       | Evaluation                                               |
    And I should see the "second" evidence summary as
      | Field               | Value                                                       |
      | document title      | Raising household saving                                    |
      | overview            | Based on an analysis of international evidence, this report |
      | evidence type       | Review                                                      |
  )
end

Then('I should see the thematic review message') do |message|
  expect(
    evidence_summaries_page.thematic_review_message.text
  ).to include(message)
end

Then('I should see the thematic review link {string}') do |link|
  expect(
    evidence_summaries_page.thematic_review_message_link[:href]
  ).to include(link)
end

Then(
  'I should see the summaries related to thematic review and has topic Saving'
) do
  steps %(
    Then I should see "1" evidence summary
    And I should see the "first" evidence summary as
      | Field               | Value                                                       |
      | document title      | Raising household saving                                    |
      | overview            | Based on an analysis of international evidence, this report |
      | evidence type       | Review                                                      |
  )
  # rubocop:enable Metrics/LineLength
end
