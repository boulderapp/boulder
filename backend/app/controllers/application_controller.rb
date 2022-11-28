class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  before_action :require_login

  private

  def form_authenticity_token
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
