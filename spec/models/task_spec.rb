require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '投稿情報の保存' do
  before do
      user = FactoryBot.create(:user)
      @task = FactoryBot.build(:task, user_id: user.id)
    end
    context '投稿した記事の保存ができるとき' do
      it '全ての情報を正しく入力すれば保存される' do
        expect(@task).to be_valid
      end
    end
    context '投稿した記事が保存できないとき' do
      it 'titileが入力されていないと投稿できない' do
        @task.title = ''
        @task.valid?
        expect(@task.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'contentが入力されていないと投稿できない' do
        @task.content = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('内容を入力してください')
      end
      it 'deadlineが入力されていないと投稿できない' do
        @task.deadline = ''
        @task.valid?
        expect(@task.errors.full_messages).to include('締切期日を入力してください')
      end
      it 'statusが入力されていないと投稿できない' do
        @task.status = nil
        @task.valid?
        expect(@task.errors.full_messages).to include('ステータスを入力してください')
      end
    end
  end
end