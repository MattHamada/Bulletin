require 'spec_helper'

describe 'Posting' do
  let(:forum) { FactoryGirl.create(:forum) }
  let(:board) { FactoryGirl.create(:board) }
  let(:sub_board) { FactoryGirl.create(:sub_board) }
  let(:user) { FactoryGirl.create(:user) }
  let(:topic) { FactoryGirl.create(:topic) }

  subject { page }
  describe 'posting a new message' do
    before do
      forum.save
      board.save
      sub_board.save
      user.save
      topic.save
      visit root_path
      click_link 'Sign in'
      fill_in 'session_username', with: user.username
      fill_in 'session_password', with: user.password
      click_button 'SIGN IN'
      click_link sub_board.title
      click_link topic.title
      click_link 'Post new message'
      fill_in  'post_content', with: 'content'
      click_button 'Post Message'
    end
    describe 'post should have users signature' do
      it { should have_content user.signature }
    end
    describe 'post should have post' do
      it { should have_content 'content' }
    end
  end


end