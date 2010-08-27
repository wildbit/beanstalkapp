module Beanstalk::API
  class ReleaseServer < Base    
    add_prefix ':repository_id'
    
    def self.find_all_for_repository(repo_id)
      raise "This method was removed. To lookup ReleaseServers use ReleaseServer#find_all_for_environment method. Sorry."
    end
    
    def self.find_for_repository(id, repository_id)
      find id, :params => { :repository_id => repository_id }
    end

    def self.find_all_for_environment(environment_id, repository_id)
      find :all, :params => { :repository_id => repository_id, :environment_id => environment_id }
    end
        
    def toggle_state!
      raise "ReleaseServer#toggle_state! method was removed due to changes in how Beanstalk Deployments work. Sorry"
    end
        
  end
end