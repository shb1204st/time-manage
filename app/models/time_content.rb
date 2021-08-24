class TimeContent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_step
  belongs_to :content
  belongs_to :ensure

  class << self
    def content_data
      @time_contents = TimeContent.all
      content_graph_data = {}
      @time_contents.each_with_index do |time_content, index|
        content_graph_data = { time_content.content.name => 0 } if index.zero?
        if content_graph_data.key?(time_content.content.name)
          content_graph_data[time_content.content.name] += 1 * 30
        else
          content_graph_data[time_content.content.name] = 1 * 30
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
    validates :time_step_id, uniqueness: { scope: [:user_id, :time_step_id, :start_time] }
    validates :content_id
    validates :ensure_id
  end

  with_options presence: true do
    validates :detail
    validates :start_time
  end

  belongs_to :user
end
