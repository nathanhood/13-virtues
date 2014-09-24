class CommitmentsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @commitment = Commitment.find(params[:id])
  end

  def update
    @commitment = Commitment.find(params[:id])

    if @commitment.update(commitment_params)
      flash[:notice] = "Virtue description has been successfully updated!"
      redirect_to virtues_path
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    @commitment = Commitment.find(params[:id]).destroy
    redirect_to virtues_path, notice: "#{@commitment.virtue.name} has been deleted."
  end

  protected
    def commitment_params
      params.require(:commitment).permit(:description)
    end

end
