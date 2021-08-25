FactoryBot.define do
  factory :time_content do
    time_step_id { 2 }
    content_id    { 2 }
    detail        { 'a' }
    start_time    { Date.today }
    ensure_id     { 2 }
    association   :user
  end
end
