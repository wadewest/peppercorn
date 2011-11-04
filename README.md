About Peppercorn
================

Peppercorn aims to be a simple and easy to use library for truncating HTML properly.  It works using the 
fast Nokogiri ruby gem to parse a string of HTML into a document fragment.  Then steppes through that document's
children until it has counted the desired number of words.

Usage
=====

The simple case is a simple string: "Hello World"

    "Hello World".truncate_html(1)  # => "Hello&#8230;"

Of course if you don't like "&#8230;" on the end you could use something else:

    "Hello World".truncate_html(1, :tail => " All")  # => "Hello All"

Now some simple HTML examples:

    "<p>Hello World, I make HTML truncation easy.</p>".truncate_html(5) # => "<p>Hello World, I make HTML&#8230;</p>"
    "<span>Hello World, I make HTML truncation easy.</span>".truncate_html(5) # => "<span>Hello World, I make HTML</span>&#8230;"

Notice the location of the tail in both examples.  In the first example the tail is placed before the end of the paragraph. 
In the second, it is placed right after the span.  Peppercorn will not append the tail to an inline level element.  As a 
result you can use a link in the tail since 'a' is an inline element:

    "<p><span>Hello World, I make HTML truncation easy.</span></p>".truncate_html(5, :tail = "...<a href\"read_more.html\">Read More</a>")

becomes:
`"<p><span>Hello World, I make HTML</span>...<a href\"read_more.html\">Read More</a></p>"`

Changelog
===

* 0.0.3 2011/11/04
  * Renamed String#truncate to String#peppercorn_truncate so peppercorn will work with rails

* 0.0.2 2011/10/28
  * Some refactoring and Added Nokogiri::XML::Node#appendable_node

* 0.0.1 2011/10/25
  * Initial Release


License
=======

Copyright (c) 2011 Wade West

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.