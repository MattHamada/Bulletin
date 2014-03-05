require 'spec_helper'

describe 'Home Page' do
  let(:board) { FactoryGirl.create(:board) }
  subject { page }
  before { visit root_path }

  it { should have_content(board.title) }
end
