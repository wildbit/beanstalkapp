module Beanstalk::API
  class Permission < Base
    
    def self.find_all_for_user(id)
      instantiate_collection(get(id))
    end
    
  end
end