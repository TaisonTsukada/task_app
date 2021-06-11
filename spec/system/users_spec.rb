require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('サインアップ')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前', with: @user.name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワードの確認', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect do
        click_button 'サインアップ'
      end.to change(User, :count).by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # 認証メールが送信されたことを確認する
      expect(page).to have_content('本人確認用のメール')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('サインアップ')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワードの確認', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect do
        click_button 'サインアップ'
      end.to change(User, :count).by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq('/users')
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: "aaaa@com"
      fill_in 'パスワード', with:  "a12345"
      # ログインボタンを押す
      click_button 'ログイン'
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('サインアップ')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するリンクがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンを押す
      click_button 'ログイン'
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end