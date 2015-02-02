require 'spec_helper'

describe Forum do
  before { @forum = Forum.new }

  subject { @forum }

  it { should respond_to :name }
end
