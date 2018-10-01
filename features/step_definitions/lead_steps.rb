Given("I visit the home page") do
  visit root_path
end

Given("I fill the form with valid info") do
  fill_in :lead_full_name, with: 'John Smith'
  fill_in :lead_business_name, with: 'Google Inc'
  fill_in :lead_email, with: 'Google Inc'
  fill_in :lead_telephone, with: "07223211232"
end

When("I submit the form") do
  click_button 'Send'
end

Then("I should see a success message") do
  expect(page).to have_content('Thank you!')
end