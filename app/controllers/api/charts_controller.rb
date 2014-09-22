class Api::ChartsController < ApplicationController

  def show
    virtues = current_user.virtues
    @reports = {}
    averages = []
    monthly_averages = []

    if virtues.length > 0
      virtues.each do |v|
        if current_user.daily_reports.length > 1
          @reports[v.name] = { name: v.name, data: format_virtue_reports(v) }
          avg = calculate_total_virtue_average(v)
          mo_avg = caculate_monthly_virtue_average(v)
          averages.push(avg)
          monthly_averages.push(mo_avg)
        end
      end
      percentages = calculate_virtue_percentage(averages)
    end

    respond_to do |format|
      format.json { render json: { reports: @reports, percentages: percentages, monthly_avg: monthly_averages } }
    end
  end

  private
    def calculate_virtue_percentage(averages)
      sum = 0
      final = []

      averages.each do |avg|
        sum += avg[:average]
      end

      averages.each do |avg|
        array = []
        average = (avg[:average].to_f / sum * 100).round(2)
        array.push(avg[:name])
        array.push(average)
        final.push(array)
      end
      final
    end

    def calculate_total_virtue_average(virtue)
        total = 0
        virtue.daily_reports.where("daily_reports.user_id = ?", current_user.id).each do |report|
          virtue_report = report.virtue_reports.where(virtue: virtue).first
          if virtue_report
            total += virtue_report.rating
          end
        end
        average = total / current_user.daily_reports.length
        virtue_avg = { name: virtue.name, average: average }
    end

    def caculate_monthly_virtue_average(virtue)
      total = 0
      virtue.daily_reports.where("daily_reports.user_id = ? AND daily_reports.created_at >= ?", current_user.id, 30.days.ago).each do |report|
        virtue_report = report.virtue_reports.where(virtue: virtue).first
        if virtue_report
          total += virtue_report.rating
        end
      end
      average = total / current_user.daily_reports.length
      virtue_avg = { name: virtue.name, data: [average] }
    end

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
