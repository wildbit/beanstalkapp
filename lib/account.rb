module Beanstalk::API
  class Account < Base
        
    # ActiveResource 2.3.2 doesn't support singular resources
    # this hack make it work.
    def self.element_path(id=nil, prefix_options={}, query_options=nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}account.#{format.extension}#{query_string(query_options)}"
    end
    
  end
end