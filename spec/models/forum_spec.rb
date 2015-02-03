require 'spec_helper'

describe Forum do
  before { @forum = Forum.new }

  subject { @forum }

  it { should respond_to :name }
  it { should respond_to :users }
  it { should respond_to :boards }

  describe 'name vailidity' do
    describe 'name cannot be blank' do
      before { @forum.name = '' }
      it { should_not be_valid }
    end
    describe 'name cannot be less than 2 char long' do
      before { @forum.name = 'a' }
      it { should_not be_valid }
    end
    describe 'name cannot be more than 50 char long' do
      before { @forum.name = 'a' * 51 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @forum.name = 'My Valid Forum Name' }
      it { should be_valid }
    end
  end
end
