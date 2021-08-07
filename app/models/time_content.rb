class TimeContent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_step
  belongs_to :content

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :time_id
    validates :content_id
  end

  with_options presence: true do
    validates :detail
    validates :start_time
  end

  belongs_to :user
end
