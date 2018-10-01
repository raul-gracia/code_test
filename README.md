# Make it Cheaper Code Test

#### 1. Fork this project to your github

#### 2. Do the test
- Api Documentation on http://mic-leads.dev-test.makeiteasy.com/api/v1/docs
- Copy/paste .env.example to .env
- Setup Api token provide by Make It Cheaper
- `bundle install`
- `rails s`

#### 3. When finish provide:
- Git url to allow us reading/run code or create a Pull Request

#### 4. Your app must start with:
- `bundle install`
- `rake db:create db:migrate` (If you use DB, sqlite3. Possible to do the test without any DB)
- `rails s`

## Test
    bundle exec rspec

### Environments variables
Check .env.example
- LEAD_API_PGUID="CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB"
- LEAD_API_PACCNAME="MicDevtest"
- LEAD_API_PPARTNER="MicDevtest"
- LEAD_API_ACCESS_TOKEN=provide_by_maket_it_cheaper

-----

We would like you to create a simple Ruby on rails application that has a single page with a form to submit a customer request using the POST endpoint of our testing REST API (You can take a look at our website homepage as an example of how we use a similar approach)


Form must contain the following fields(See API swagger documentation for the required validations): 
- Customer full name
- Business name
- Email
- Telephone number

The initial ruby on rails base project is in here: https://github.com/makeitcheaper/code_test

 
You will find a readme file in the repository explaining how to setup the project and other explanation.

You need to:

Fork the project
On completion: Send us a link to your public Github URL or create a Pull request.
 
For the API integration - API swagger documentation:  http://mic-leads.dev-test.makeiteasy.com/api/v1/docs#!/Enqueue/post_api_v1_create

 
Feel free to spend as much or as little time on the exercise as you like as long as the following requirements have been met:

 

1. Please complete the user story below.
2. Your code should run and be fully functional
3. Feel free to use whatever frameworks / libraries / gems you like.
4. TDD (Rspec with Unit test, mock external service)
5. Quality code: Best practices, Separation of concerns, Don’t reinvent the wheel,  Keep the code simple as possible. Refactor as necessary.

If possible commit often so we can see your way of working

# User Story
```
As a user running the application

I can see some basic information about the company and submit my contact details for a call back

So that I can request a call back
```

# Acceptance criteria
- [ ] Page displayed with a basic form to request a call back
- [ ] Leads are received successfully by the API on form submission
- [ ] Form fields are validating accordingly
- [ ] A thank you message is displayed to let you know that your request was submitted successfully and that MakeItCheaper will contact you
- [ ] When form failed to submit due to being down or an error we want the user to see a nice message instead of a generic error.

Bonus: Create a decent looking homepage (don’t reinvent the wheel use bootstrap)