module Beanstalk::API
  class ReleaseServer < Base    
    add_prefix ':repository_id'
  end
end