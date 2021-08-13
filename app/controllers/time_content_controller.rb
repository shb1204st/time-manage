class TimeContentController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_time_content, only: [:show, :edit, :update, :destroy]
  before_action :move_into_index, only: [:show, :edit]

  def index
    @time_contents = TimeContent.where(user_id: current_user)
    # @time_contents = TimeContent.all #1つのカレンダーでユーザー全員の内容を閲覧
    @day = Time.zone.today
    now = Time.current
    @week = now.ago(6.days)
    @month = now.prev_month

    @content_month_graph_data = TimeContent.where(user_id: current_user, start_time: @month..now).content_data
    @background_colors = TimeContent.where(user_id: current_user, start_time: @month..now).background_color_content_data
    @content_week_graph_data = TimeContent.where(user_id: current_user, start_time: @week..now).content_data
    @background_colors = TimeContent.where(user_id: current_user, start_time: @week..now).background_color_content_data
    @content_day_graph_data = TimeContent.where(user_id: current_user, start_time: @day).content_data
    @background_colors = TimeContent.where(user_id: current_user, start_time: @day).background_color_content_data
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

  def edit
  end

  def update
    if @time_content.update(time_content_params)
      redirect_to time_content_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @time_content.destroy
  end

  private

  def time_content_params
    params.require(:time_content).permit(:start_time, :time_step_id, :content_id, :detail).merge(user_id: current_user.id)
  end

  def set_time_content
    @time_content = TimeContent.find(params[:id])
  end

  def move_into_index
    redirect_to action: :index if current_user.id != @time_content.user.id
  end
end
