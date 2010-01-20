module Beanstalk::API
  class Release < Base
    add_prefix ':repository_id'
    
    def self.find_all_for_repository(repo_id)
      find :all, :params => { :repository_id => repo_id }
    end
    
    def self.find_for_repository(id, repo_id)
      find id, :params => { :repository_id => repo_id }
    end
    
  end
end