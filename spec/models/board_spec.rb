require 'spec_helper'

describe Board do
  before { @board = Board.new(title: 'Test Board') }
  subject { @board }

  it { should respond_to(:title) }
end
