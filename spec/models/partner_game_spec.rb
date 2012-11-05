require 'spec_helper'

describe 'PartnerGame' do
  before(:each) do
    @game = PartnerGame.new(
      instructions: 'bar',
      name: 'foo',
      publisher: 'GoodGame'
    )
  end

  it 'should extends Game' do
    PartnerGame.ancestors.include?(Game).should be_true
  end

  it 'should have instructions' do
    lambda{ @game.instructions }.should_not raise_error
    @game.instructions.should == 'bar'
  end

  it 'should have publisher' do
    lambda{ @game.publisher }.should_not raise_error
    @game.publisher.should == 'GoodGame'
  end
end