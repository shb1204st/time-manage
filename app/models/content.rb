class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '書類作成' },
    { id: 3, name: '打合' },
    { id: 4, name: '会議' },
    { id: 5, name: '点検' },
    { id: 6, name: '電話' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :time_contents
end