module ApplicationHelper
  def add_daily_report?
    if current_user.virtues.length > 0
      if current_user.daily_reports.length > 0
        if current_user.daily_reports.last.created_at > Date.today
          return false
        else
          return true
        end
      else
        return true
      end
    else
      return false
    end
  end
end
