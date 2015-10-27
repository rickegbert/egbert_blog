class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'admin'
  protect_from_forgery with: :exception
  before_filter :login?

  private

  def login?
    redirect_to admin_login_path if current_admin.blank?
  end

  def current_admin
    @current_admin ||= Admin.find_by(auth_token: cookies[:auth_token])
  end

  helper_method :current_admin
end
