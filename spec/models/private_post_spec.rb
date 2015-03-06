require 'spec_helper'

describe PrivatePost do
  let(:private_message) { FactoryGirl.create(:private_message) }
  let(:user)         { FactoryGirl.create(:user) }

  before do
    user.save
    private_message.save
    @private_post = PrivatePost.new(content: 'My private post text',
                                    user_id: user.id)
  end

  subject { @private_post }

  it { should respond_to :content}
  it { should respond_to :user }
  it { should respond_to :private_message }

  describe 'content vailidity' do
    describe 'content cannot be blank' do
      before { @private_post.content = '' }
      it { should_not be_valid }
    end
    describe 'content cannot be more than 100 char long' do
      before { @private_post.content = 'a' * 1025 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @private_post.content = 'My Valid Board Name' }
      it { should be_valid }
    end
  end
end