require 'nokogiri'

module Peppercorn
  
  module XML
    
    # Extensions to Nokogiri::XML::Node
    module Node
  
      # (see Peppercorn::String#truncate_html)
      def truncate(length, opts={})
        opts = Peppercorn::DEFAULT_TRUNCATION_OPTIONS.merge(opts)
    
        doc = self
        target = nil
        count = 0
        overran = false
    
        if doc.text?
          result = content.truncate(length, opts.merge(Peppercorn::TRUNCATE_CHILD_OPTS))
          target = result[:text]
          count = result[:count]
          overran = result[:overran]
        else
          target = doc.clone
          target.children.remove
          doc.children.each do |child|
            result = child.truncate(length-count, opts.merge(Peppercorn::TRUNCATE_CHILD_OPTS))
            count += result[:count]
            overran = result[:overran]
            target << result[:text]
            break if overran
          end
        end
        
        return nil if target.nil?
        
        
        if opts[:strip]
          last_text_node = target.last_text_node
          last_text_node.content = last_text_node.content.sub(/(\s+)$/, '') if last_text_node
        end
        
        if !opts[:tail].to_s.empty? and overran
          append_to = target.children.last
          loop do
            if append_to.text? or append_to.description.inline? # We want to append to the last block-level element
              append_to = append_to.parent
              break;
            end
            append_to = append_to.children.last
          end
          append_to << Nokogiri::HTML::DocumentFragment.parse(opts[:tail])
        end
        
        target = target.inner_html unless opts[:return_node]
        return opts[:return_hash] ? {:text => target, :count => [count, length].min, :overran => overran} : target
    
      end
  
      # Returns the last child node that is a text node
      # @return [Nokogiri::XML::Node] the last text node
      # @since 0.0.1
      def last_text_node
        return self if text? and !content.empty?

        children.reverse.each do |child|
          ltn = child.last_text_node
          return ltn unless ltn.nil?
        end

        return nil
      end
    
    end
  end
end

# Include Peppercorn::XML::Node in Nokogiri::XML::Node (http://nokogiri.org)
class Nokogiri::XML::Node
  include Peppercorn::XML::Node
end