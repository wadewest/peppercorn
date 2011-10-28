require 'spec_helper'

describe String do
  
  before do
    @string = "Hello World, I make HTML truncation easy."
  end
  
  it "should be able to strip whitespaces from the end of the string" do
    "    \t\t\t#{@string}\t   \r\n".strip_end.should eql "    \t\t\t#{@string}"
  end
  
  it "should be able to strip HTML tags from the string" do
    string = "The quick brown fox jumps over the lazy dog."
    html = "<p class=\"example\">The <em>quick</em> brown <i>fox jumps</i> over the lazy dog.</p>"
    html.strip_html.should eql string
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
  
  it "should truncate HTML just like plain text when the HTML contains no tags" do 
    html = @string
    html.truncate_html(3).should eql @string.truncate(3)
  end
  
  it "should allow a link in the tail" do
    opts = {:tail => "...<a href=\"some_page.html\">Read More</a>"}
    @string.truncate(3, opts).should eql "Hello World, I#{opts[:tail]}"
  end
  
  it "should be able to use a Nokogiri::XML::Node as the tail" do
    opts = {:tail => Nokogiri::HTML::DocumentFragment.parse("...<a href=\"some_page.html\">Read More</a>")}
    @string.truncate(3, opts).should eql "Hello World, I#{opts[:tail].to_s}"
  end
  
end