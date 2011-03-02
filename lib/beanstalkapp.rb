require 'active_resource'

module Beanstalk
  module API
  end
end

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require_local 'beanstalkapp/base'
require_local 'beanstalkapp/account'
require_local 'beanstalkapp/plan'
require_local 'beanstalkapp/changeset'
require_local 'beanstalkapp/repository'
require_local 'beanstalkapp/comment'
require_local 'beanstalkapp/server_environment'
require_local 'beanstalkapp/release'
require_local 'beanstalkapp/release_server'
require_local 'beanstalkapp/user'