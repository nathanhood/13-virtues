class DailyReportsController < ApplicationController

  def new
    @daily_report = DailyReport.new
  end

  def create
    @daily_report = DailyReport.new(entry: params[:daily_report][:entry], user: current_user)
    if @daily_report.save
      flash[:notice] = "Today's report has been successfully saved!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Something went wrong, your report was not saved."
      render :new
    end
  end

  private
    def virtue_params
      params.require(:daily_report).permit(:entry)
    end
end
