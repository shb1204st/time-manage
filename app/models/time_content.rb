class TimeContent < ApplicationRecord
  before_save :set_time_zone

  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :time_step
  belongs_to :content
  belongs_to :ensure

  class << self
    def content_data
      @time_contents = TimeContent.all
      content_graph_data = {}
      @time_contents.each_with_index do |time_content, index|
        content_graph_data = { time_content.content.name => 0 } if index.zero?
        if content_graph_data.key?(time_content.content.name)
          content_graph_data[time_content.content.name] += 1 * (time_content.finish_time - time_content.begin_time) / 3600
        else
          content_graph_data[time_content.content.name] = 1 * (time_content.finish_time - time_content.begin_time) / 3600
        end
      end
      content_graph_data
    end

    def background_color_content_data
      @time_contents = TimeContent.all
      content_graph_data = {}
      background_colors = []
      @time_contents.each_with_index do |time_content, index|
        if index.zero?
          content_graph_data = { time_content.content.name => 0 }
          background_colors << time_content.content.backcolor
        end
        if content_graph_data.key?(time_content.content.name)
          content_graph_data[time_content.content.name] += 1
        else
          content_graph_data[time_content.content.name] = 1
          background_colors << time_content.content.backcolor
        end
      end
      background_colors
    end
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    # validates :time_step_id, uniqueness: { scope: [:user_id, :time_step_id, :start_time] }
    validates :content_id
    validates :ensure_id
  end

  with_options presence: true do
    validates :detail
    validates :start_time
    validates :begin_time, uniqueness: { scope: [:user_id, :begin_time, :start_time] }
    validates :finish_time, uniqueness: { scope: [:user_id, :finish_time, :start_time] }
  end

    validate :begin_finish_check
    validate :begin_check
    validate :finish_check
    validate :begin_time_from_to
    validate :finish_time_from_to
    validate :begin_finish_not_overlap
    
    def begin_finish_check
      if Date.today
        errors.add(:finish_time, "は開始時刻より遅い時間を選択してください") if begin_time.strftime( "%H:%M" ) > finish_time.strftime( "%H:%M" )
      end
    end
  
    def begin_check
      if Date.today
        errors.add(:begin_time, "は現在時刻より早い時間を選択してください") if begin_time.strftime( "%H:%M" ) > Time.now.strftime( "%H:%M" )
      end
    end
  
    def finish_check
      if Date.today
        errors.add(:finish_time, "は現在時刻より早い時間を選択してください") if finish_time.strftime( "%H:%M" ) > Time.now.strftime( "%H:%M" )
      end
    end

    def begin_time_from_to
      errors.add(:begin_time, "は6時から21時45分までの時間を選択してください") if begin_time.strftime( "%H:%M" ) < "06:00" || begin_time.strftime( "%H:%M" ) > "21:45"
    end

    def finish_time_from_to
      errors.add(:finish_time, "は6時15分から22時までの時間を選択してください") if finish_time.strftime( "%H:%M" ) < "06:15" || finish_time.strftime( "%H:%M" ) > "22:00"
    end

    def begin_finish_not_overlap
      return unless begin_time && finish_time

      if TimeContent.where(user_id: user_id, start_time: start_time).where('begin_time < ?', finish_time).where('finish_time > ?', begin_time).where.not(id: id).exists?
        errors.add(:base, '「開始時間」もしくは「終了時間」が登録済みの時間と重複しています')
      end
    end

    def set_time_zone
      year = Date.today.year
      month = Date.today.month
      day = Date.today.day
  
      self.begin_time = self.begin_time.change(year: year, month: month, day: day)
      self.finish_time = self.finish_time.change(year: year, month: month, day: day)

    end  

  belongs_to :user
end
