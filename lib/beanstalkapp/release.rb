module Beanstalk::API
  class Release < Base
    
    def find_all_for_repository(repo_id)
      find :all, :params => { :repository_id => repo_id }
    end
    
  end
end