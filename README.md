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



{include:file:CHANGELOG.md}

License
=======

Copyright (c) 2011 Wade West

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.