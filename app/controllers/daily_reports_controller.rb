class DailyReportsController < ApplicationController

  def new
    @daily_report = DailyReport.new
    current_user.virtues.each do |virtue|
      @daily_report.virtue_reports.build(virtue: virtue)
    end
  end

  def create
    @daily_report = DailyReport.new(entry: params[:daily_report][:entry], user: current_user)

    if @daily_report.save && create_virtue_reports(params[:daily_report])
      flash[:notice] = "Today's report has been successfully saved!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Something went wrong, your report was not saved. Please make sure to rate yourself on all virtues."
      render :new
    end
  end

  def index
    @daily_reports = current_user.daily_reports
  end

  def show

  end

  private
    def virtue_params
      params.require(:daily_report).permit(:entry, :virtue_reports)
    end

    def create_virtue_reports(report)
      virtues = []
      report[:virtue_reports].each_key do |virtue_id|

        virtue = Virtue.find(virtue_id)
        virtue_report = VirtueReport.new(rating: report[:virtue_reports][virtue_id][:rating], daily_report: @daily_report, virtue: virtue)
        if virtue_report.save
          virtues.push(virtue_report)
        else
          flash.now[:alert] = "The rating for #{virtue.name} could not be saved"
        end
      end

      current_user.virtues.length == virtues.length ? true : false
    end
end
