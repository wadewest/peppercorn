require "peppercorn/version"

# The peppercorn gem is a library for helping out with HTML, XML, and Strings.
#
# Peppercorn added some methods to the String and Nokogiri::XML::Node classes to do its work.
module Peppercorn
  
  # Default options for truncating strings and html
  #   * WARNING: The undocumented options could change or be removed with any release without notice *
  DEFAULT_TRUNCATION_OPTIONS = {
    # Documented options
    :tail => "&#8230;",
    # Undocumented options
    :strip => true,
    :return_hash => false,
    :return_node => false
  }

  
  # Options to override when recursively truncating a child node
  TRUNCATE_CHILD_OPTS = {
	  :tail => nil,
	  :return_hash => true,
	  :return_node => true,
	  :strip => false
	}

end

require "peppercorn/string"
require "peppercorn/xml/node"
