class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # flash.notice = "Welcome back, #{current_user.email}!"
    profile_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
