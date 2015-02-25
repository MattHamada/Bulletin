require 'spec_helper'
require 'helpers/sign_in_user'

describe 'Topic Pages' do
  let(:forum) { FactoryGirl.create(:forum) }
  let(:board) { FactoryGirl.create(:board) }
  let(:sub_board) { FactoryGirl.create(:sub_board) }
  let(:user) { FactoryGirl.create(:user) }

  subject { page }
  before do
    forum.save
    board.save
    sub_board.save
    user.save
    sign_in_user
    click_link sub_board.title
  end
  describe 'Create new topic' do
    before { click_link 'New topic' }

    describe 'invalid with no title' do
      before do
        fill_in 'topic_post_text', with: 'My new post'
        click_button 'Create'
      end
      it { should have_content "Title can't be blank" }
    end
    describe 'invalid with title < 2 char' do
      before do
        fill_in 'topic_title', with: 'a'
        fill_in 'topic_post_text', with: 'My new post'
        click_button 'Create'
      end
      it { should have_content 'too short' }
    end
    describe 'invalid with title > 100 char' do
      before do
        fill_in 'topic_title', with: 'a' * 101
        fill_in 'topic_post_text', with: 'My new post'
        click_button 'Create'
      end
      it { should have_content 'too long' }
    end
    describe 'invalid with blank post' do
      before do
        fill_in 'topic_title', with: 'my topic title'
        click_button 'Create'
      end
      it { should have_content "Content can't be blank" }
    end
    describe 'invalid with content > 1024 char' do
      before do
        fill_in 'topic_title', with: 'hey there'
        fill_in 'topic_post_text', with: 'a' * 1025
        click_button 'Create'
      end
      it { should have_content 'too long' }
    end
    describe 'valid with proper length for title and content' do
      before do
        fill_in 'topic_title', with: 'my new topic'
        fill_in 'topic_post_text', with: 'my post content'
        click_button 'Create'
      end
      it { should_not have_content 'invalid' }
    end
  end
end