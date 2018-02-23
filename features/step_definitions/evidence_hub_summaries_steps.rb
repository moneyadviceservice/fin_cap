Given("I entered into the Insight page {string}") do |title|
  evidence_hub_summary_page.load(page_type: 'insights', slug: title.parameterize)
end

Then("I should see the content") do |table|
  binding.pry
  table
end
