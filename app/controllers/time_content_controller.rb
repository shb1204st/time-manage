class TimeContentController < ApplicationController
  def index
    @time_contents = TimeContent.all
  end

  def new
    @time_content = TimeContent.new
  end

  def create
    TimeContent.create(time_content_parameter)
    redirect_to root_path
  end

  private

  def time_content_parameter
    params.require(:time_content).permit(:start_time, :time_id, :content_id, :detail )
  end

end
