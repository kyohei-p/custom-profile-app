require 'rails_helper'

Rspec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規登録が成功する' do

        end
      end
      context 'メールアドレスが未入力' do
        it 'ユーザーの新規登録が失敗する'
      end
      context '登録済みのメールアドレスを使用' do
        it 'ユーザーの新規登録が失敗する'
      end
    end
  end

  describe 'ログイン後' do
    describe 'プロフィール編集' do
      context 'フォームの入力値が正常' do
        it 'プロフィールの編集が成功する'
      end
      context '自己紹介文が未入力' do
        it 'プロフィールの編集が失敗する'
      end
    end
  end
end