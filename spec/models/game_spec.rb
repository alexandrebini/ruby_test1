require 'spec_helper'

describe 'Game' do
  before(:each) do
    @game = Game.new(
      developer: 'Rovio',
      name: 'Super Mario',
      ratings: {
        good: 100,
        poor: 20,
        very_good: 20
      },
      views: [
        { date: Date.today, count: 100 }
      ]
    )
  end

  it 'should have a name' do
    lambda{ @game.name }.should_not raise_error
    @game.name.should == 'Super Mario'
  end

  it 'should not have instructions' do
    lambda{ @game.instructions }.should raise_error
  end

  it 'should have a developer' do
    lambda{ @game.developer }.should_not raise_error
    @game.developer.should == 'Rovio'
  end

  it 'should have views' do
    lambda{ @game.views }.should_not raise_error
    @game.views.should == [{ date: Date.today, count: 100 }]
  end

  it 'views should be an array' do
    @game.views.is_a?(Array).should be_true
  end

  it 'should have ratings' do
    lambda{ @game.ratings }.should_not raise_error
    @game.ratings.should == { good: 100, poor: 20, very_good: 20 }
  end

  it 'ratings should be a hash' do
    @game.ratings.is_a?(Hash).should be_true
  end

  it 'should have a slug' do
    lambda{ @game.slug }.should_not raise_error
  end

  it 'slug should be auto assign based on name' do
    @game.slug.should == 'super-mario'
  end

  it 'should change when name changes' do
    @game.slug.should == 'super-mario'
    @game.name = 'Sonic 3d'
    @game.slug.should == 'sonic-3d'
  end

  it 'should not have an url' do
    lambda{ @game.url }.should raise_error
  end

  it 'should not have a publisher' do
    lambda{ @game.publisher }.should raise_error
  end

  it 'should not have a publisher' do
    lambda{ @game.publisher }.should raise_error
  end

end