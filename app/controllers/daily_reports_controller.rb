class DailyReportsController < ApplicationController

  def new
    @daily_report = DailyReport.new
  end

  def create
    @daily_report = DailyReport.new(entry: params[:daily_report][:entry], user: current_user)

    if @daily_report.save && create_virtue_reports(params[:daily_report])
      flash[:notice] = "Today's report has been successfully saved!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Something went wrong, your report was not saved."
      render :new
    end
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

      virtues.length == report[:virtue_reports].length ? true : false
    end
end
