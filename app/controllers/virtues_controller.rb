class VirtuesController < ApplicationController
  before_action :all_virtues, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @virtue = Virtue.new
  end

  def create
    virtue = Virtue.find_by(name: params[:virtue][:name])
    if virtue.nil?
      @virtue = Virtue.create(name: params[:virtue][:name])
    else
      @virtue = virtue
    end

    @commitment = Commitment.new(description: params[:virtue][:commitments][:description], user: current_user, virtue: @virtue)
    if @commitment.save
      flash.now[:notice] = "Success! Your virtue has been added."
    else
      flash.now[:alert] = "Something went wrong. Your virtue was not added."
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
