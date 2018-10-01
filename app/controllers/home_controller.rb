class HomeController < ApplicationController
  def index
    @lead = Lead.new
  end

  def create
    response = ApiService.new.create_lead(lead_params)
    if response.valid?
      flash.now.notice = "Thank you!"
      render 'thank_you'
    else
      @lead = response.lead
      flash.now.alert = response.error
      render 'index'
    end
  end

  private 
  def lead_params
    params.require(:lead).permit(:name, :business_name, :email, :telephone_number)
  end

end
