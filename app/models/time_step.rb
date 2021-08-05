class TimeStep < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '9:00~9:30' },
    { id: 3, name: '9:30~10:00' },
    { id: 4, name: '10:00~10:30' },
    { id: 5, name: '10:30~11:00' },
    { id: 6, name: '11:00~11:30' },
    { id: 7, name: '11:30~12:00' },
    { id: 8, name: '12:00~12:30' },
    { id: 9, name: '12:30~13:00' },
    { id: 10, name: '13:00~13:30' },
    { id: 11, name: '13:30~14:00' },
    { id: 12, name: '14:00~14:30' },
    { id: 13, name: '14:30~15:00' },
    { id: 14, name: '15:00~15:30' },
    { id: 15, name: '15:30~16:00' },
    { id: 16, name: '16:00~16:30' },
    { id: 17, name: '16:30~17:00' },
    { id: 18, name: '17:00~17:30' }
  ]

  include ActiveHash::Associations
  has_many :time_contents
end