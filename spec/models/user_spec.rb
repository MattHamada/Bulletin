require 'spec_helper'

describe User do
  before { @user = User.new(username: 'testUser',
                            email: 'user@example.com',
                            password: 'Foobar1',
                            password_confirmation: 'Foobar1')}
  subject { @user }

  it { should respond_to :username }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_token }
  it { should respond_to :topics }
  it { should respond_to :post_count }

  describe 'post count' do
    describe 'post count set to 0 on create' do
      before { @user.save }
      it { @user.post_count.should eq 0 }
    end
    describe 'post count should increment when new post made by user' do
      before do
        @user.save
        Post.create(content: 'My post text...',
                    topic_id: 1,
                    user_id: @user.id)
        @user.reload
      end
      it { @user.post_count.should eq 1 }
    end
  end


  describe 'bad parameters' do
    describe 'username' do
      describe 'when username missing' do
        before { @user.username = '' }
        it { should_not be_valid }
      end
      describe 'when username is less than 3 characters' do
        before { @user.username = 'ab' }
        it { should_not be_valid }
      end
      describe 'when username is more than 15 characters' do
        before { @user.username = 'a'*16 }
        it { should_not be_valid }
      end
    end

    describe 'email' do
      describe 'when email missing' do
        before { @user.email = '' }
        it { should_not be_valid }
      end
      describe 'when not a valid email format'
        before { @user.email = 'e/@sx.@.com'}
        it { should_not be_valid }
      describe 'when format is valid' do
        before { @user.email = 'test@testsite.com'}
        it { should be_valid }
      end
    end

    describe 'password' do
      describe 'when password is blank' do
        before { @user.password = @user.password_confirmation = '' }
        it { should_not be_valid }
      end
      describe 'when password does not match password_confirmation' do
        before { @user.password = 'barrFo1' }
        it { should_not be_valid }
      end
      describe 'when password is less than 6 characters' do
        before { @user.password = @user.password_confirmation = 'abC12' }
        it { should_not be_valid }
      end
      describe 'when password has no capital letters' do
        before { @user.password = @user.password_confirmation = 'foobar1' }
        it { should_not be_valid }
      end
      describe 'when password is all capital' do
        before { @user.password = @user.password_confirmation = 'FOOBAR1' }
        it { should_not be_valid }
      end
      describe 'when password has no numbers' do
        before { @user.password = @user.password_confirmation = 'Foobar' }
        it { should_not be_valid }
      end
      describe 'when password has uppercase, lowercase, numbers, and 6+ characters' do
        before { @user.password = @user.password_confirmation = 'Foobar1' }
        it { should be_valid }
      end
    end
  end


end
