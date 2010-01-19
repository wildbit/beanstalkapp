module Beanstalk::API
  class Changeset < Base
    
    def self.find_all_for_repository(repo_id)
      get :repository, :repository_id => repo_id
    end
    
    def self.find_for_repository(id, repo_id)
      find id, :params => { :repository_id => repo_id }
    end
    
    # ActiveResource 2.3.2 doesn't support loading of nested arrays and symbols
    # we submitted a patch to the Rails Core but it's not committed yet
    # https://rails.lighthouseapp.com/projects/8994/tickets/2394-support-for-loading-nested-arrays-in-activeresource
    
    def load(attributes)
      raise ArgumentError, "expected an attributes Hash, got #{attributes.inspect}" unless attributes.is_a?(Hash)
      @prefix_options, attributes = split_options(attributes)
      attributes.each do |key, value|
        @attributes[key.to_s] = typecast_attribute_value(key, value)
      end
      self
    end
  
  private
  
    def typecast_attribute_value(attribute, value)
      case value
        when Array
          resource = find_or_create_resource_for_collection(attribute)
          value.map do |attrs|
            if attrs.is_a?(Symbol) || attrs.kind_of?(Numeric)
              attrs
            elsif attrs.is_a?(String)
              attrs.dup
            elsif attrs.is_a?(Array)
              typecast_attribute_value(attribute, attrs)
            else
              resource.new(attrs)
            end
          end
        when Hash
          resource = find_or_create_resource_for(attribute)
          resource.new(value)
        else
          value.dup rescue value
      end
    end
    
  end
end