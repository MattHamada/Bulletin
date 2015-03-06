require 'spec_helper'

describe PrivateMessage do
  before { @private_message = PrivateMessage.new(title: 'Test PM') }
  subject { @private_message }

  it { should respond_to :title }
  it { should respond_to :private_posts }
  it { should respond_to :creator }
  it { should respond_to :creator_username }
  it { should respond_to :recipient }
  it { should respond_to :recipient_username }

  describe 'title vailidity' do
    describe 'title cannot be blank' do
      before { @private_message.title = '' }
      it { should_not be_valid }
    end
    describe 'title cannot be less than 2 char long' do
      before { @private_message.title = 'a' }
      it { should_not be_valid }
    end
    describe 'title cannot be more than 100 char long' do
      before { @private_message.title = 'a' * 101 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @private_message.title = 'My Valid PM Name' }
      it { should be_valid }
    end
  end
end