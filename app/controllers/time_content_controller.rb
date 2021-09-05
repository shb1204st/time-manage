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

  def past_record
    @yesterday = Date.yesterday
    @last_week = Date.today.last_week.all_week
    @week = Date.today.all_week
    @last_month = Date.today.last_month.all_month
    @friday = Date.today.prev_occurring(:friday)
    @task_saturday = TimeContent.where(user_id: current_user, start_time: Date.today.prev_occurring(:saturday))
    @task_sunday = TimeContent.where(user_id: current_user, start_time: Date.today.prev_occurring(:sunday))


    @content_yesterday_graph_data = TimeContent.where(user_id: current_user,
                                                      start_time: @yesterday).order('content_id ASC').content_data
    @background_yesterday_colors = TimeContent.where(user_id: current_user,
                                                     start_time: @yesterday).order('content_id ASC').background_color_content_data

    @content_friday_graph_data = TimeContent.where(user_id: current_user,
                                                      start_time: @friday).order('content_id ASC').content_data
    @background_friday_colors = TimeContent.where(user_id: current_user,
                                                     start_time: @friday).order('content_id ASC').background_color_content_data
    
    @content_week_graph_data = TimeContent.where(user_id: current_user, 
                                                start_time: @week).order('content_id ASC').content_data
    @background_week_colors = TimeContent.where(user_id: current_user,
                                                start_time: @week).order('content_id ASC').background_color_content_data

    @content_last_week_graph_data = TimeContent.where(user_id: current_user,
                                                      start_time: @last_week).order('content_id ASC').content_data
    @background_last_week_colors = TimeContent.where(user_id: current_user,
                                                     start_time: @last_week).order('content_id ASC').background_color_content_data

    @content_last_month_graph_data = TimeContent.where(user_id: current_user,
                                                             start_time: @last_week).order('content_id ASC').content_data
    @background_last_month_colors = TimeContent.where(user_id: current_user,
                                                        start_time: @last_week).order('content_id ASC').background_color_content_data
                                                       
    @content_yesterday_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                          start_time: @yesterday).order('content_id ASC').content_data
    @background_yesterday_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                         start_time: @yesterday).order('content_id ASC').background_color_content_data

    @content_friday_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                            start_time: @friday).order('content_id ASC').content_data
    @background_friday_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                         start_time: @friday).order('content_id ASC').background_color_content_data
  
    @content_week_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                        start_time: @week).order('content_id ASC').content_data
    @background_week_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                       start_time: @week).order('content_id ASC').background_color_content_data

    @content_last_week_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                       start_time: @last_week).order('content_id ASC').content_data
    @background_last_week_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                      start_time: @last_week).order('content_id ASC').background_color_content_data

    @content_last_month_reduce_graph_data = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                              start_time: @last_month).order('content_id ASC').content_data
    @background_last_month_reduce_colors = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                             start_time: @last_month).order('content_id ASC').background_color_content_data



    @yesterday_total_time = TimeContent.where(user_id: current_user, start_time: @yesterday).order('content_id ASC').content_data
    @yesterday_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                     start_time: @yesterday).order('content_id ASC').content_data

    @friday_total_time = TimeContent.where(user_id: current_user, start_time: @friday).order('content_id ASC').content_data
    @friday_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                    start_time: @friday).order('content_id ASC').content_data

    @last_week_total_time = TimeContent.where(user_id: current_user, start_time: @last_week).order('content_id ASC').content_data
    @last_week_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                     start_time: @last_week).order('content_id ASC').content_data

    @week_total_time = TimeContent.where(user_id: current_user, start_time: @week).order('content_id ASC').content_data
    @week_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                start_time: @week).order('content_id ASC').content_data

    @last_month_reduce_total_time = TimeContent.where(user_id: current_user, ensure_id: 3,
                                                      start_time: @last_month).order('content_id ASC').content_data
    @last_month_total_time = TimeContent.where(user_id: current_user,
                                               start_time: @last_month).order('content_id ASC').content_data
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
    @p = TimeContent.where(user_id: current_user).order('start_time ASC', 'begin_time ASC', 'finish_time ASC').ransack(params[:q])
  end

  def set_detail_search_column
    @start_time = TimeContent.where(user_id: current_user).select('start_time').order('start_time ASC').distinct
    @begin_time = TimeContent.where(user_id: current_user).select('begin_time').order('begin_time ASC').distinct
    @finish_time = TimeContent.where(user_id: current_user).select('finish_time').order('finish_time ASC').distinct
  end
end
