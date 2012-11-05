require 'spec_helper'

describe 'Download' do
  before(:each) do
    @download = Download.new(
      counter: [
        { date: Date.today, count: 100 }
      ],
      name: "Slender Man's Shadow - Prison",
      url: 'http://cs-portable.com'
    )
  end

  it 'should have a name' do
    lambda{ @download.name }.should_not raise_error
    @download.name.should == "Slender Man's Shadow - Prison"
  end

  it 'should have counter' do
    lambda{ @download.counter }.should_not raise_error
    @download.counter.should == [{ date: Date.today, count: 100 }]
  end

  it 'counter should be an array' do
    @download.counter.is_a?(Array).should be_true
  end

  it 'should have url' do
    lambda{ @download.url }.should_not raise_error
    @download.url.should == 'http://cs-portable.com'
  end

  it 'should have slug' do
    lambda { @download.slug }.should_not raise_error
  end

  it 'slug should not have special characters' do
    @download.slug.should == 'slender-mans-shadow-prison'
  end
end