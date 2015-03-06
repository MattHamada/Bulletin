require 'spec_helper'

describe Topic do
  before { @topic = Topic.new(title: 'Test Topic') }
  subject { @topic }

  it { should respond_to :title }
  it { should respond_to :sub_board }
  it { should respond_to :creator }
  it { should respond_to :posts }
  it { should respond_to :post_count }

  describe 'title vailidity' do
    describe 'title cannot be blank' do
      before { @topic.title = '' }
      it { should_not be_valid }
    end
    describe 'title cannot be less than 2 char long' do
      before { @topic.title = 'a' }
      it { should_not be_valid }
    end
    describe 'title cannot be more than 100 char long' do
      before { @topic.title = 'a' * 101 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @topic.title = 'My Valid Board Name' }
      it { should be_valid }
    end
  end

  describe 'posts should be set to 0 when created' do
    before { @topic.save }
    it { @topic.post_count.should eq 0 }
  end
end
