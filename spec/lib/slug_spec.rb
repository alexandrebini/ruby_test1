# encoding: utf-8
require 'spec_helper'

describe 'Slug' do
  let(:dummy_class) do
    Class.new do
      include Slug
    end
  end

  before(:each) do
    @dummy_object = dummy_class.new
  end

  it 'should be a module' do
    Slug.ancestors.should == [Slug]
  end

  it 'should respond to to_slug' do
    @dummy_object.respond_to?(:to_slug).should be_true
  end

  it 'should be always in downcase' do
    @dummy_object.to_slug('AAABBBCCC').should == 'aaabbbccc'
  end

  it "should replace special A's" do
    @dummy_object.to_slug('áàâäã').should == 'aaaaa'
  end

  it "should replace special E's" do
    @dummy_object.to_slug('éèêë').should == 'eeee'
  end

  it "should replace special I's" do
    @dummy_object.to_slug('íìîï').should == 'iiii'
  end

  it "should replace special O's" do
    @dummy_object.to_slug('óòôöõ').should == 'ooooo'
  end

  it "should replace special U's" do
    @dummy_object.to_slug('úùûü').should == 'uuuu'
  end

  it "should replace 'ç' for 'c'" do
    @dummy_object.to_slug('ç').should == 'c'
  end

  it 'should special characters' do
    @dummy_object.to_slug("']{}assada_[]{").should == 'assada'
  end

  it 'should replace double dashs for one dash' do
    @dummy_object.to_slug('fo - bar').should == 'fo-bar'
  end

  it 'should replace spaces for dash' do
    @dummy_object.to_slug('mario flash 3d').should == 'mario-flash-3d'
  end
end