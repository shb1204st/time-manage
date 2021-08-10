class TimeContent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_step
  belongs_to :content

    def self.content_data
        @time_contents = TimeContent.all
        content_graph_data = {}
        @time_contents.each_with_index do |time_content, index|
          content_graph_data = { time_content.content.name => 0 } if index.zero?
          if content_graph_data.key?(time_content.content.name)
            content_graph_data[time_content.content.name] += 1
          else
            content_graph_data[time_content.content.name] = 1
          end
        end
        content_graph_data
    end
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :time_step_id
    validates :content_id
  end

  with_options presence: true do
    validates :detail
    validates :start_time
  end

  belongs_to :user

end
