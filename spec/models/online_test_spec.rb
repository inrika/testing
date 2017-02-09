require 'spec_helper'

describe OnlineTest do

  it "validates the title and makes sure it's not empty" do
    #online_test = OnlineTest.new(title: '')
    online_test=FactoryGirl.build(:online_test, title:'')
    online_test.valid?
    online_test.errors[:title].should_not be_empty
  end

  it "validates the title and makes sure it's not empty" do
    #online_test = OnlineTest.new(title: '')
    #    online_test=FactoryGirl.build(:online_test, title:'')
    online_test=FactoryGirl.create(:online_test)

    online_test.valid?
    online_test.errors[:title].should be_empty
  end
end