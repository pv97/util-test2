class Api::SubscriptionsController < ApplicationController
  before_action :require_logged_in
  before_action :charge_api_usage

  def index
    @subscriptions = Subscription.where(user_id:current_user.id)
    render "api/subscriptions/index"
  end
end
