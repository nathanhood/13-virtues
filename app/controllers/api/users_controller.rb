class Api::UsersController < ApplicationController

  def show
    virtues = current_user.virtues
    @reports = {}
    virtues.each do |v|
      @reports[v.name] = { name: v.name, data: format_virtue_reports(v.virtue_reports) }
    end
    respond_to do |format|
      format.json { render json: { reports: @reports } }
    end
  end

  private
    def format_virtue_reports(virtue_reports)
      final = []
      virtue_reports.each do |report|
        array = []
        array.push(format_date(report.updated_at))
        array.push(report.rating)
        final.push(array)
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
