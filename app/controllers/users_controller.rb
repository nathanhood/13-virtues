class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    last_report = current_user.daily_reports.first
    if last_report && last_report.created_at < Date.today
      redirect_to new_daily_report_path
    end
  end
end
