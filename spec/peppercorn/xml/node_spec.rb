require 'spec_helper'

describe String do
  
  before do
    @string = "<p><em class=\"strong\">Hello World</em>, I <i>can</i> make HTML truncation easy.</p>"
    @html = Nokogiri::HTML::DocumentFragment.parse @string
  end

  it "should properly truncate some simple HTML" do
    @html.truncate(6).should eql "<p><em class=\"strong\">Hello World</em>, I <i>can</i> make HTML&#8230;</p>"
  end

  it "should not truncate some HTML that is shorter than length" do
    @html.truncate(30).should eql @string
  end
  
end