class Api::ApiUsagesController < ApplicationController
  before_action :require_logged_in

  def index
    @api_usages = ApiUsage.where(user_id:current_user.id)
    render "api/api_usages/index"
  end
end
