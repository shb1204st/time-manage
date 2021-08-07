require 'rails_helper'

RSpec.describe TimeContent, type: :model do
  before do
    @time_content = FactoryBot.build(:time_content)
  end

  describe '時間内容登録' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@time_content).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'start_timeが空では登録できないこと' do
        @time_content.start_time = ""
        @time_content.valid?
        expect(@time_content.errors.full_messages).to include("Start time can't be blank")
      end

      it 'time_idの選択が1では登録できないこと' do
        @time_content.time_id = 1
        @time_content.valid?
        expect(@time_content.errors.full_messages).to include("Time can't be blank")
      end

      it 'content_idの選択が1では登録できないこと' do
        @time_content.content_id = 1
        @time_content.valid?
        expect(@time_content.errors.full_messages).to include("Content can't be blank")
      end

      it 'detailが空では登録できないこと' do
        @time_content.detail = ''
        @time_content.valid?
        expect(@time_content.errors.full_messages).to include("Detail can't be blank")
      end

      it 'userが紐づいていなければ登録できないこと' do
        @time_content.user = nil
        @time_content.valid?
        expect(@time_content.errors.full_messages).to include("User must exist")
      end
    end
  end
end
