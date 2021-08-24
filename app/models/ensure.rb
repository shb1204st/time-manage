class Ensure < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自分だけ可能' },
    { id: 3, name: '他の人も可能' }
  ]

  include ActiveHash::Associations
  has_many :time_contents
end
