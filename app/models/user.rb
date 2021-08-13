class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー ]+\z/, message: "は全角の漢字もしくはひらがなもしくはカタカナで入力してください"}
    validates :kana_name,  format: { with: /\A[ァ-ヶー ]+\z/,message: "は全角のカタカナで入力してください" }
    validates :department
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字で入力してください"  }

  has_many :time_contents
end
