require 'spec_helper'

describe Post do
  let(:topic) { FactoryGirl.create(:topic) }
  let(:user)  { FactoryGirl.create(:user) }
  before { @post = Post.new(content: 'My post text...',
                            topic_id: topic.id,
                            user_id: user.id) }
  subject { @post }

  it { should respond_to :content }
  it { should respond_to :user }
  it { should respond_to :topic }

  describe 'content vailidity' do
    describe 'content cannot be blank' do
      before { @post.content = '' }
      it { should_not be_valid }
    end
    describe 'content cannot be more than 100 char long' do
      before { @post.content = 'a' * 1025 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @post.content = 'My Valid Board Name' }
      it { should be_valid }
    end
  end

  describe 'making a post should update the topic update time' do
    before do
      user.save
      @post.save
    end
    it { @post.updated_at.to_s.should eq @post.topic.updated_at.to_s}
  end
end
