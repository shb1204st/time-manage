class TimeContentController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_time_content, only: [:show, :edit, :update, :destroy]
  before_action :move_into_index, only: [:show, :edit]
  before_action :search_time_content, only: [:index, :show, :keyword_search, :detail_search]

  def index
    @time_contents = TimeContent.where(user_id: current_user)
    # @time_contents = TimeContent.all #1つのカレンダーでユーザー全員の内容を閲覧
    @day = Date.today
    @month = Date.today.all_month

    @content_month_graph_data = TimeContent.where(user_id: current_user, start_time: @month).order('content_id ASC').content_data
    @background_month_colors = TimeContent.where(user_id: current_user,
                                                 start_time: @month).order('content_id ASC').background_color_content_data

    @content_month_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                         start_time: @month).order('content_id ASC').content_data
    @background_month_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                        start_time: @month).order('content_id ASC').background_color_content_data

    @content_day_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                       start_time: @day).order('content_id ASC').content_data
    @background_day_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                      start_time: @day).order('content_id ASC').background_color_content_data

    @content_day_graph_data = TimeContent.where(user_id: current_user, start_time: @day).order('content_id ASC').content_data
    @background_colors = TimeContent.where(user_id: current_user,
                                           start_time: @day).order('content_id ASC').background_color_content_data

    @day_total_time = TimeContent.where(user_id: current_user, start_time: @day).order('content_id ASC').content_data
    @day_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                               start_time: @day).order('content_id ASC').content_data
    @month_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                 start_time: @month).order('content_id ASC').content_data
    @month_total_time = TimeContent.where(user_id: current_user, start_time: @month).order('content_id ASC').content_data
  end

  def new
    @time_content = TimeContent.new
  end

  def create
    @time_content = TimeContent.new(time_content_params)
    if @time_content.save
      flash[:notice] = '内容を登録しました'
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
      flash[:success] = '内容を編集しました'
      redirect_to time_content_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @time_content.destroy
  end

  def keyword_search
    @results = @p.result.includes(:user)
  end

  def detail_search
    @results = @p.result.includes(:user)
    set_detail_search_column
  end

  private

  def time_content_params
    params.require(:time_content).permit(:start_time, :begin_time, :finish_time, :content_id, :ensure_id,
                                         :detail).merge(user_id: current_user.id)
  end

  def set_time_content
    @time_content = TimeContent.find(params[:id])
  end

  def move_into_index
    redirect_to action: :index if current_user.id != @time_content.user.id
  end

  def search_time_content
    @p = TimeContent.where(user_id: current_user).order('start_time ASC', 'time_step_id ASC').ransack(params[:q])
  end

  def set_detail_search_column
    @start_time = TimeContent.where(user_id: current_user).select('start_time').order('start_time ASC').distinct
  end
end
