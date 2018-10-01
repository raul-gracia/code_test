Given("I visit the home page") do
  visit root_path
end

Given("I fill the form with valid info") do
  fill_in :lead_name, with: 'John Smith'
  fill_in :lead_business_name, with: 'Google Inc'
  fill_in :lead_email, with: 'john@gmail.com'
  fill_in :lead_telephone_number, with: "07223211232"
end

Given("I fill the form with invalid info") do
  fill_in :lead_name, with: 'John'
  fill_in :lead_business_name, with: 'Google Inc'
  fill_in :lead_email, with: 'john@gmail.com'
  fill_in :lead_telephone_number, with: "12323211232"
end

When("I submit the form") do
  click_button 'Send'
end

Then("I should see a success message") do
  expect(page).to have_content('Thank you!')
end

Then("I should see an error message") do
  expect(page).to have_content('Please check the errors below')
end

Given("api service is misconfigured") do
  ENV['LEAD_API_ACCESS_TOKEN'] = 'invalid'
end

Then("I should see an api error message") do
  expect(page).to have_content('There was a error with the API Service')
end

