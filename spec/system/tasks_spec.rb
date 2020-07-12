require 'rails_helper'

describe 'ツイート管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, email: 'a@ne.jp') }
  let(:user_b) { FactoryBot.create(:user, email: 'b@ne.jp') }
  let!(:tweet_a) { FactoryBot.create(:tweet, body: '最初のツイート', user: user_a) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_button 'Log in'
  end

  shared_examples_for 'ユーザーAが作成したツイートが表示される' do
    it { expect(page).to have_content '最初のツイート' }
  end

  describe '一覧表示機能' do

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成したツイートが表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it_behaves_like 'ユーザーAが作成したツイートが表示される'
    end
  end

  describe '新規投稿機能' do

    context 'ログインしたユーザーAが投稿したとき' do
      let(:login_user) { user_a }

      before do
        visit new_tweet_path
        fill_in 'ツイート', with: 'Aのツイート'
        click_button 'Create Tweet'
      end

      it '投稿一覧にユーザーAの投稿が表示される' do
        expect(page).to have_content 'Aのツイート'
      end
    end

  end


end
