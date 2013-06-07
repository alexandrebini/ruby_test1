require 'spec_helper'

describe 'NormalGame' do
  it 'should extends Game' do
    NormalGame.ancestors.include?(Game).should be_true
  end

  it 'should have instructions' do
    game = NormalGame.new(instructions: 'bar')
    lambda{ game.instructions }.should_not raise_error
    game.instructions.should == 'bar'
    cccccccccc
  end
end