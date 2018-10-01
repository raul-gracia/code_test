require 'rails_helper'


RSpec.describe ApiService do
  describe "#create_lead" do
    context "with correct data" do
      it "should return a struct with the valid flag" do
        params = {
          'name' => 'John Smith',
          'business_name' => 'Google Inc',
          'email' => 'john@gmail.com',
          'telephone_number' => '07332345676'
        }

        VCR.use_cassette("valid_lead_api") do
          service = ApiService.new.create_lead(params)
          expect(service).to be_valid
        end
      end
    end
    context "with incorrect data" do
      it "should return a struct with a list of errors" do
        params = {
          'name' => 'John',
          'business_name' => 'Google Inc',
          'email' => 'john@gmail.com',
          'telephone_number' => '12073323676'
        }

        VCR.use_cassette("invalid_lead_api") do
          service = ApiService.new.create_lead(params)
          expect(service).to_not be_valid
          errors = service.lead.errors
          expect(errors.keys).to match_array [:name, :telephone_number]
          expect(errors.full_messages).to match_array [
            "Name wrong format, 'name' must be composed with 2 separated words (space between)",
            "Telephone number wrong format (must contain have valid phone number with 11 numbers. string max 13 chars)"
          ]
        end
      end
    end
    context "with incorrect configuration" do
      it "should return a struct with an error message" do
        ENV['LEAD_API_ACCESS_TOKEN'] = 'invalid'
        params = {
          'name' => 'John Smith',
          'business_name' => 'Google Inc',
          'email' => 'john@gmail.com',
          'telephone_number' => '07332345676'
        }

        VCR.use_cassette("invalid_config_lead_api") do
          service = ApiService.new.create_lead(params)
          expect(service).to_not be_valid
          expect(service.error).to eq 'Unauthorised access_token'
        end
      end
    end
  end
end
