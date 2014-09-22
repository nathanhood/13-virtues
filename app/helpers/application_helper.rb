module ApplicationHelper
  def add_daily_report?
    if current_user.virtues.length > 0
      if current_user.daily_reports.length > 2
        if current_user.daily_reports.last.created_at > Date.today
          return false
        else
          return true
        end
      else
        return false
      end
    else
      return false
    end
  end

  def needs_to_add_more_daily_reports?
    if current_user.virtues.length > 0
      if current_user.daily_reports.length < 2
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
