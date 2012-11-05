require 'spec_helper'

describe 'Analytics' do
  let(:dummy_class) do
    Class.new do
      include Analytics
      has_analytics :views
      attr_accessor :views

      def initialize(options)
        @views = options[:views]
      end
    end
  end

  before(:each) do
    @dummy_object = dummy_class.new(views: [])
    @second_object = dummy_class.new(views: [])
    31.times do |i|
      view = {
        date: (Date.today - i),
        count: (i+1) * 10
      }

      @dummy_object.views << view
      @second_object.views << view
    end
  end

  it 'should be able to get the total views' do
    lambda{ @dummy_object.total_views }.should_not raise_error
    @dummy_object.total_views.should == 4960
  end

  it 'should be able to get the today views' do
    lambda{ @dummy_object.today_views }.should_not raise_error
    @dummy_object.today_views.should == 10
  end

  it 'should be able to get the last week views' do
    lambda{ @dummy_object.last_week_views }.should_not raise_error
    @dummy_object.last_week_views.should == 280
  end

  it 'should be able to get the last month views' do
    pending
    lambda{ @dummy_object.last_month_views }.should_not raise_error
    @dummy_object.last_month_views.should == 4960
  end

  it 'should be able to get the average of views' do
    dummy_class.average_views.should == 4960
  end

  it 'should be able to get the average of last week views'
  it 'should be able to get the average of last month views'
end