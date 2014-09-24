class Api::ChartsController < ApplicationController

  def show
    virtues = current_user.virtues.where("virtues.created_at <= ?", 7.days.ago)
    @reports = {}
    averages = []
    monthly_averages = []
    
    if virtues.length > 0 || virtues
      virtues.each do |v|
        if current_user.daily_reports.length > 1
          @reports[v.name] = { name: v.name, data: format_virtue_reports(v) }
          avg = v.calculate_total_virtue_average(current_user)
          mo_avg = v.calculate_monthly_virtue_average(current_user)
          averages.push(avg)
          monthly_averages.push(mo_avg)
        end
      end
      percentages = Virtue.calculate_virtue_percentage(averages)
    end

    respond_to do |format|
      format.json { render json: { reports: @reports, percentages: percentages, monthly_avg: monthly_averages } }
    end
  end

  private
    def format_virtue_reports(virtue)
      final = []
      reports = virtue.daily_reports.where("daily_reports.user_id = ? AND daily_reports.created_at >= ?", current_user.id, 1.year.ago).order("created_at ASC")

      if reports.length > 1
        reports.each do |report|
          array = []
          virtue_report = report.virtue_reports.where(virtue: virtue).first
          array.push(format_date(report.created_at))
          array.push(virtue_report.rating)
          final.push(array)
        end
      end
      final
    end

    def format_date(date)
      date = date.to_s.split(" ")[0].split("-")
      date.each_index do |i|
        new_date = []
        new_date.push(date[i])
        new_date
      end
    end
end
