require 'spec_helper'

describe 'Home Page' do
  let(:forum) {FactoryGirl.create(:forum) }
  let(:board) { FactoryGirl.create(:board) }
  subject { page }
  before do
    forum.save
    board.save
    visit root_path
  end

  it { should have_content(board.title) }
end
