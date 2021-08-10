class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '書類作成',backcolor: "#00f" }, #blue
    { id: 3, name: '打合', backcolor: "#f00" }, #red
    { id: 4, name: '会議', backcolor: "#ff0" }, #yellow
    { id: 5, name: '点検', backcolor: "#0f0" }, #lime
    { id: 6, name: '電話', backcolor: "#f0f" }, #fuchsia
    { id: 7, name: 'その他', backcolor: "#008000" } #purple
  ]

  include ActiveHash::Associations
  has_many :time_contents
end
