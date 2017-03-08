class Api::UtilitiesController < ApplicationController
  before_action :require_logged_in
  before_action :charge_api_usage
  
  def index
    @utilities = Utility.all
    render "api/utilities/index"
  end
end
