require 'spec_helper'
require 'helpers/has_image'
require 'helpers/sign_in_user'

describe 'Create Account' do
  let(:forum) { FactoryGirl.create(:forum) }
  let(:board) { FactoryGirl.create(:board) }
  let(:user) { FactoryGirl.create(:user) }

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
    before do
      user.save
      visit user_path(user)
    end
    it { should have_content user.username }
    it { should have_content user.email }
    it { should have_image 'default/missing.png'}
    it { should have_content user.post_count }
  end

  describe 'Edit user page' do
    before do
      user.save
      sign_in_user
      click_link 'My account'
      click_link 'Edit'
    end
    it { should have_content 'Edit Account' }

    describe 'Editing user' do
      describe 'must enter password to make changes' do
        before { click_button 'Update' }
        it { should have_content 'contains 1 error' }
      end

      describe 'Attributes update with a valid password' do
        before do
          fill_in  'user_email', with: 'newmail@newmail.new'
          fill_in  'user_password', with: user.password
          click_button 'Update'
        end
        it { should have_content 'newmail@newmail.new'}
      end
    end
  end

  describe 'Sign in user' do
    before do
      user.save
      visit root_path
      click_link 'Sign in'
    end
    describe 'with invalid email' do
      before do
        fill_in 'session_username', with: 'fakeemail@email.com'
        fill_in 'session_password', with: user.password
        click_button 'SIGN IN'
      end
      it { should have_content 'Invalid username/password combination' }
      it { should have_content 'Sign in' }
      it { should_not have_content 'Sign out'}
    end
    describe 'with invalid password' do
      before do
        fill_in 'session_username', with: user.username
        fill_in 'session_password', with: 'pass'
        click_button 'SIGN IN'
      end
      it { should have_content 'Invalid username/password combination' }
      it { should have_content 'Sign in' }
      it { should_not have_content 'Sign out'}
    end
    describe 'with valid info' do
      before do
        fill_in 'session_username', with: user.username
        fill_in 'session_password', with: user.password
        click_button 'SIGN IN'
      end
      it { should have_content 'Sign out' }
      it { should_not have_content 'Sign in'}
    end
  end

  describe 'Sign out user' do
    before do
      user.save
      visit root_path
      click_link 'Sign in'
      fill_in 'session_username', with: user.username
      fill_in 'session_password', with: user.password
      click_button 'SIGN IN'
    end
    describe 'it should sign the user out when sign out clicked' do
      before { click_link 'Sign out' }
      it { should have_content 'Sign in' }
      it { should_not have_content 'Sign out' }
    end
  end
end
