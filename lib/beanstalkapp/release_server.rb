module Beanstalk::API
  class ReleaseServer < Base    
    add_prefix ':repository_id'
    
    def self.find_all_for_repository(repo_id)
      find :all, :params => { :repository_id => repo_id }
    end
    
    def self.find_for_repository(name, repo_id)
      find name, :params => { :repository_id => repo_id }
    end
    
    def to_param
      name
    end
    
    def toggle_state!
      repo_id = prefix_options[:repository_id]
      path = element_path(:repository_id => repo_id, :id => to_param).gsub(".xml", '/toggle_state.xml')
      connection.put(path)
    end
        
  end
end