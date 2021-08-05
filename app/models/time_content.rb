class TimeContent < ApplicationRecord
  belons_to :user

  with_options numericality: { other_than: 1, message: "is invalid" } do
   validates :time_id
   validates :content_id
  end

  with_options presence: true do
   validates :detail
   validates :start_time 
  end
end
