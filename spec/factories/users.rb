FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name                  { person.kanji }
    kana_name             { person.katakana }
    department            { Faker::Company.type }
  end
end
