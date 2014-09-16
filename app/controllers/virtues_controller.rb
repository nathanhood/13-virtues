class VirtuesController < ApplicationController
  before_action :all_virtues, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @virtue = Virtue.new
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def create
    @virtue = Virtue.new(name: params[:virtue][:name])
    @commitment = Commitment.new(description: params[:virtue][:commitments][:description], user: current_user, virtue: @virtue)
    if @virtue.save && @commitment.save
      flash.now[:notice] = "It worked!!"
    else
      flash.now[:alert] = "No worky!!"
    end
  end

  private

    def all_virtues
      @virtues = Virtue.all
    end

    def virtue_params
      params.require(:virtue).permit(:name, :description)
    end
end
