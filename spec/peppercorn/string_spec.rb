require 'spec_helper'

describe String do
  
  before do
    @string = "Hello World, I make HTML truncation easy."
  end
  
  it "should properly truncate a string" do
    @string.truncate(5).should eql "Hello World, I make HTML&#8230;"
  end
  
  it "should not truncate a string shorter than length" do
    @string.truncate(30).should eql @string
  end
  
  it "should properly truncate some simple HTML" do
    "<em>#{@string}</em>".truncate_html(5).should eql "<em>Hello World, I make HTML</em>&#8230;"
  end
  
end