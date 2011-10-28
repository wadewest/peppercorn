require 'spec_helper'

describe String do
  
  before do
    @string = "<p class=\"appendable\"><em class=\"strong\">Hello World</em>, I <i>can</i> make HTML truncation <i>easy.</i></p>"
    @html = Nokogiri::HTML::DocumentFragment.parse @string
  end

  it "should properly truncate some simple HTML" do
    @html.truncate(6).should eql "<p class=\"appendable\"><em class=\"strong\">Hello World</em>, I <i>can</i> make HTML&#8230;</p>"
  end

  it "should not truncate some HTML that is shorter than length" do
    @html.truncate(30).should eql @string
  end
  
  it "should return the last appendable node" do
    @html.appendable_node.attribute('class').to_s.should eql "appendable"
  end
  
end