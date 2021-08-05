class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー ]+\z/ }
    validates :kana_name,  format: { with: /\A[ァ-ヶー ]+\z/ }
    validates :department
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
