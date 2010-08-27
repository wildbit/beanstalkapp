module Beanstalk::API
  class Release < Base
    add_prefix ':repository_id'
    
    def self.find_all_for_repository(repo_id)
      raise "This method was removed. To lookup Releases use Release#find_all_for_environment method. Sorry."
    end
    
    def self.find_all_for_environment(environment_id, repo_id, page=nil)
      params = { :repository_id => repo_id, :environment_id => environment_id }
      if page
        params[:page] = page
      end
      find :all, :params => params
    end
    
    def self.find_for_repository(id, repo_id)
      find id, :params => { :repository_id => repo_id }
    end
    
  end
end