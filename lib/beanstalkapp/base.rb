module Beanstalk
  module API
    class Base < ActiveResource::Base
      def self.setup(options)
        options[:host] ||= "beanstalkapp.com"
        self.site = "http://#{options[:domain]}.#{options[:host]}/api"
        self.user = options[:login]
        self.password = options[:password]
      end
    
      def self.add_prefix(str)
        str.gsub!(/^\//, '')
        class_eval(<<-CODE)
          def self.site
            URI.parse(File.join(Beanstalk::API::Base.site.to_s, #{str.inspect}))
          end
        CODE
      end
    end
  end
end