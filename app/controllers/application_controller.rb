class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
#    return nil unless session[:session_token]
#    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user = User.all[0]
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    render json: {base: ['invalid credentials']}, status: 401 if !current_user
  end

  def charge_api_usage
    @api_usage = ApiUsage.new()
    @api_usage.user_id = current_user.id
    @api_usage.cost = 0.10
    @api_usage.save
  end

end
