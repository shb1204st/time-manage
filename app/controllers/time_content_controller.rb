class TimeContentController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @time_contents = TimeContent.all
  end

  def new
    @time_content = TimeContent.new
  end

  def create
    @time_content = TimeContent.new(time_content_params)
      if @time_content.save
        redirect_to root_path
      else
        render :new
      end
  end

  private

  def time_content_params
    params.require(:time_content).permit(:start_time, :time_id, :content_id, :detail ).merge(user_id: current_user.id)
  end

end
