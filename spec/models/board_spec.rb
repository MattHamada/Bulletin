require 'spec_helper'

describe Board do
  before { @board = Board.new(title: 'Test Board') }
  subject { @board }

  it { should respond_to(:title) }
  it { should respond_to :forum }
  it { should respond_to :sub_boards }
  it { should respond_to :topics }

  describe 'name vailidity' do
    describe 'name cannot be blank' do
      before { @board.title = '' }
      it { should_not be_valid }
    end
    describe 'title cannot be less than 2 char long' do
      before { @board.title = 'a' }
      it { should_not be_valid }
    end
    describe 'title cannot be more than 100 char long' do
      before { @board.title = 'a' * 101 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @board.title = 'My Valid Board Name' }
      it { should be_valid }
    end
  end
end
