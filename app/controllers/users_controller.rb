class UsersController < ApplicationController
  before_action :authenticate_user!, except: :guest_sign_in

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      user.kana_name = 'ゲスト'
      user.department = '社長'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
