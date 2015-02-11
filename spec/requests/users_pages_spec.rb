require 'spec_helper'
require 'helpers/has_image'

describe 'Create Account' do
  let(:forum) { FactoryGirl.create(:forum) }
  let(:board) { FactoryGirl.create(:board) }
  # let(:sub_board) { FactoryGirl.create(:sub_board) }
  # let(:topic) { FactoryGirl.create(:topic) }
  subject { page }
  before do
    forum.save!
    board.save!
    visit root_path
  end
  it { should have_content 'Sign in' }
  it { should have_content 'Create account' }

  describe 'Account creation page' do
    before { click_link 'Create account' }
    it { should have_content 'Create Account' }

    describe 'Account with invalid input' do
      describe 'with missingfields' do
        before { click_button 'Create' }
        it { should have_content 'Create Account' }
        it { should have_content "can't be blank" }
        it { should have_content 'too short'}
        it { should have_content 'include at least'}
        it { should have_content 'not a valid email address' }
      end
    end
    describe 'with valid input' do
      before do
        fill_in 'user_username', with: 'mrUser'
        fill_in 'user_email', with: 'user@email.com'
        fill_in 'user_password', with: 'Qwerty123'
        click_button 'Create'
      end
      it { should have_content 'Sign out' }
      it { should_not have_content 'Sign in'}
      it { should_not have_content 'Create account' }
      it { should_not have_content 'the form contains' }
    end
    describe 'user create page creates a new user' do
      before do
        fill_in 'user_username', with: 'mrUser'
        fill_in 'user_email', with: 'user@email.com'
        fill_in 'user_password', with: 'Qwerty123'
      end
      it 'should create a user' do
        expect do
          click_button 'Create'
          User.all.reload
        end.to change(User, :count)
      end
    end
  end
  describe 'User profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      user.save
      visit user_path(user)
    end
    it { should have_content user.username }
    it { should have_content user.email }
    it { should have_image 'default/missing.png'}
    it { should have_content user.post_count }
  end
end
