class TimeContentController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_time_content, only:[:show]
  before_action :move_into_index, only: [:show]

  def index
    @time_contents = TimeContent.where(user_id: current_user)
    # @time_contents = TimeContent.all #1つのカレンダーでユーザー全員の内容を閲覧
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

  def show
  end

  private

  def time_content_params
    params.require(:time_content).permit(:start_time, :time_step_id, :content_id, :detail).merge(user_id: current_user.id)
  end

  def set_time_content
    @time_content = TimeContent.find(params[:id])
  end

  def move_into_index
    if current_user.id != @time_content.user.id
      redirect_to action: :index
    end
  end
end
