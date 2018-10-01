class HomeController < ApplicationController
  def index
  end

  def create
    flash.now.notice = "Thank you!"
    # flash.now.alert = "Upps. Something is wrong"
    render 'index'
  end
end
