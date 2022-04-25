class ApplicationController < ActionController::API
  include SessionsHelper
  before_action :require_login

  private

  def require_login
    render(json: { error: "You must be logged in to access this section" }, status: 401) unless logged_in?
  end
end
