module ApplicationHelper
  def daily_report_submitted?
    if current_user.daily_reports.length > 0
      if current_user.daily_reports.first.created_at > Date.today
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def has_virtues?
    if current_user.virtues.length > 0
      return true
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
