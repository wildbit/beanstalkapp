module Beanstalk::API
  class User < Base
    
    def self.find_current
      get :current
    end
    
  end
end