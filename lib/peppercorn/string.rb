require 'nokogiri'

module Peppercorn
  # Peppercorn extension to the String class
  module String
  
    # Truncate a string to "length" words
    # @since 0.0.3
    # @param [Fixnum] length the number of word to truncate on
    # @param [Hash] opts hash of truncation options
    # @option opts [#to_s, nil] :tail ("&#8230;") the object to append to the truncated string
    # @return [String] the truncated string
    def peppercorn_truncate(length=30, opts={})
      opts = Peppercorn::DEFAULT_TRUNCATION_OPTIONS.merge(opts)
      tokens = scan(/\W*\w+\W*/)
      string_tokens = tokens[0...length]
      string = string_tokens.join
      overran = length <= tokens.size
      string = string.strip_end if opts[:strip]
      string << opts[:tail].to_s if overran
      if opts[:return_node]
        string = Nokogiri::HTML::DocumentFragment.parse(string)
        string = string.child if string.children.size == 1
      end
      return opts[:return_hash] ? {:text => string, :overran => overran, :count => [length, tokens.size].min} : string
    end
    
    # Alias for #peppercorn_truncate
    # @since 0.0.1
    def truncate(length=30, opts={})
      peppercorn_truncate(length, opts)
    end
  
    # Strips all whitespaces from the end of the string
    # @since 0.0.1
    # @return [String] the stripped version of the string
    def strip_end
      return rstrip
    end
  
    # Returns the string with all HTML tags removed
    # @since 0.0.1
    # @return [String] the string stripped of all HTML
    def strip_html
      return Nokogiri::HTML::DocumentFragment.parse(self).inner_text
    end
  
    # Truncate a string of html to "length" words
    # @since 0.0.1
    # @param (see #truncate)
    # @return [String] the truncated html
    # @option opts [String, Nokogiri::XML::Node, nil] :tail ("&#8230;") string or xml node to append to the truncated string
    def truncate_html(length=30, opts={})
      Nokogiri::HTML::DocumentFragment.parse(self).truncate(length, opts)
    end
  end
end

# Include Peppercorn::String in String
class String
  include Peppercorn::String
end