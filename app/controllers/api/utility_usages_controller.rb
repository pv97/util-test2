class Api::UtilityUsagesController < ApplicationController
  before_action :require_logged_in
  before_action :charge_api_usage

  def index
    @utility_usage = UtilityUsage.where(user_id:current_user.id)
    render "api/utility_usage/index"
  end
end
