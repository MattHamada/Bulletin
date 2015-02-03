require 'spec_helper'

describe SubBoard do
  before { @sub_board = SubBoard.new(title: 'Test Board') }
  subject { @sub_board }

  it { should respond_to(:title) }
  it { should respond_to :board }
  it { should respond_to :topics }

  describe 'name vailidity' do
    let(:board) { FactoryGirl.create(:board) }
    before do
      board.save!
      @sub_board.update_attribute(:board_id, board.id)
    end
    describe 'name cannot be blank' do
      before { @sub_board.title = '' }
      it { should_not be_valid }
    end
    describe 'title cannot be less than 2 char long' do
      before { @sub_board.title = 'a' }
      it { should_not be_valid }
    end
    describe 'title cannot be more than 100 char long' do
      before { @sub_board.title = 'a' * 101 }
      it { should_not be_valid }
    end
    describe 'should be valid with valid size' do
      before { @sub_board.title = 'My Valid Board Name' }
      it { should be_valid }
    end
    describe 'cannot have two subboards with same name in same board' do
      let(:board2) { FactoryGirl.create(:board, title: 'board2') }
      before { board2.save! }
      describe 'duplicate names allowed in different boards' do
        before { @sub_board2 = SubBoard.create(title: 'Test Board', board_id: 2)}
        it { expect(@sub_board2).to be_valid }
      end
      describe 'duplicate names not allowed in same board' do
        before { @sub_board2 = SubBoard.create(title: 'Test Board', board_id: 1)}
        it { expect(@sub_board2).not_to be_valid }
      end
    end
  end
end
