require 'spec_helper'

describe 'ExternalGame' do
  before(:each) do
    @game = ExternalGame.new(
      name: 'foo',
      url: 'http://www.angrybirds.com/'
    )
  end

  it 'should extends Game' do
    ExternalGame.ancestors.include?(Game).should be_true
    aaaaaaa
  end

  it 'should have an url' do
    lambda{ @game.url }.should_not raise_error
    @game.url.should == 'http://www.angrybirds.com/'
  end

  it 'should not have instructions' do
    lambda{ @game.instructions }.should raise_error
  end
end