require 'rails_helper'

describe 'ユーザー管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, email: 'a@ne.jp') }
  let(:user_b) { FactoryBot.create(:user, email: 'b@ne.jp') }
  let!(:tweet_a) { FactoryBot.create(:tweet, body: '最初のツイート', user: user_a) }

  # before do
  #   visit new_user_session_path
  #   fill_in 'Email', with: login_user.email
  #   fill_in 'Password', with: login_user.password
  #   click_button 'Log in'
  # end

  shared_examples_for 'ユーザーAが作成したツイートが表示される' do
    it { expect(page).to have_content '最初のツイート' }
  end

  # テスト一覧
  describe '新規ユーザー作成' do

    context '新規作成画面でemail,password,passwordconfirmationを正しく入力したとき' do
      before do
        visit new_user_registration_path
        fill_in 'Email', with: 'test@ne.jp'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
      end

      it '正常に登録される' do
        # within 'h1' do
        #   expect(page).to have_content 'Tweets#index'
        # end
        expect(page).to have_selector 'h1', text: 'Tweets#index'
      end
    end
  end
end

