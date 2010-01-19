module Beanstalk::API
  class Comment < Base
    add_prefix ':repository_id'
  end
end