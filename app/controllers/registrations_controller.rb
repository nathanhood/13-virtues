class RegistrationsController < Devise::RegistrationsController
  protected

    def after_sign_up_path_for(resource)
      flash.notice = "Welcome to 13 Virtues, #{current_user.email}!"
      profile_path
    end

    def after_update_path_for(resource)
      flash.notice = "Your account was updated successfully."
      dashboard_path
    end
end
