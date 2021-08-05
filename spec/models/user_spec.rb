require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複していると登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がなければ登録できないこと' do
        @user.email = 'test.example'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '0000000a'
        @user.password_confirmation = '000000a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nameが空では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.name = 'ﾔﾏﾀﾞﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid')
      end

      it 'kana_nameが空では登録できないこと' do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name can't be blank")
      end

      it 'kana_nameが全角（カタカナ）でなければ登録できないこと' do
        @user.kana_name = 'ﾔﾏﾀﾞﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana name is invalid')
      end

      it 'departmentが空では登録できないこと' do
        @user.department = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Department can't be blank")
      end
    end
  end
end
