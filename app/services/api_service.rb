class ApiService
  include HTTParty
  base_uri 'http://mic-leads.dev-test.makeiteasy.com/api/v1'

  def initialize
    @options = default_options
  end

  def create_lead(params)
    lead = Lead.new(params.slice('name', 'business_name', 'email', 'telephone_number'))
    lead_service = OpenStruct.new(lead: '', valid?: false, error: '')

    if lead.valid?
      res = self.class.post("/create", body: @options.merge(lead.to_hash))
      case res.code
      when 201
        lead_service.send("valid?=", true)
      when 400
        parse_response_errors(res.parsed_response["errors"], lead)
        lead_service.error = "Please check the errors below" 
      when 401, 500
        lead_service.send("valid?=", false)
        lead_service.error = res.parsed_response["message"] 
      end
    else
      lead_service.send("valid?=", false)
    end

    lead_service.lead = lead

    lead_service
  end


  private

  def create_new_lead(lead)
    self.class.post("/create", @options.merge(lead.to_hash))
  end

  def parse_response_errors(errors, lead)
    errors.each do |error|
      parsed_error = parse_error(error)
      if parsed_error.field.in?(lead.to_hash.keys)
        lead.errors.add(parsed_error.field, parsed_error.message)
      end
    end
  end

  def parse_error(error)
    match = error.match(/Field '(.*?)' (.*)/).to_a
    match.shift
    if match.any?
      parsed = OpenStruct.new(field: '', message: '')
      parsed.field = match.first.to_sym
      parsed.message = match.last    

      parsed
    end
  end

  def default_options
    {
      pGUID: ENV['LEAD_API_PGUID'],
      pAccName: ENV['LEAD_API_PACCNAME'],
      pPartner: ENV['LEAD_API_PPARTNER'],
      access_token: ENV['LEAD_API_ACCESS_TOKEN']
    }
  end
end