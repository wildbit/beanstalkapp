module Beanstalk::API
  class ReleaseServer < Base    
    add_prefix ':repository_id'
    
    def find_all_for_repository(repo_id)
      find :all, :params => { :repository_id => repo_id }
    end
    
    def find_for_repository(name, repo_id)
      find name, :params => { :repository_id => repo_id }
    end
    
  end
end