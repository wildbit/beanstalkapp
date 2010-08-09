require 'rubygems'
$: << "lib/"
require 'lib/beanstalkapp'

Beanstalk::API::Base.setup(
  :host     => 'beanstalk.local',
  :domain   => 'apricode',
  :login    => 'railsmonk',
  :password => '123456'
)

def test(code_or_text)
  puts "---- #{code_or_text}"
  if block_given?
    p yield
  else
    p eval(code_or_text)
  end
  puts
end

$repository_id = 15
$environment_id = 6
$release_server_id = 7
$release_id = 57
$existing_revision = "f99193ed1f3dcdfa7f30632049a944ca4a53c139"

test "Beanstalk::API::Account.find"
test "Beanstalk::API::Repository.find($repository_id)"
test "Beanstalk::API::Repository.find(:all)"
test "Beanstalk::API::Release.find_all_for_repository($repository_id)"
test "Beanstalk::API::Release.find_for_repository($release_id, $repository_id)"
test "Beanstalk::API::ReleaseServer.find_all_for_environment($environment_id, $repository_id)"
test "Beanstalk::API::ReleaseServer.find_for_repository($release_server_id, $repository_id)"
test "Beanstalk::API::ServerEnvironment.find_all_for_repository($repository_id)"
test "Beanstalk::API::ServerEnvironment.find_for_repository($environment_id, $repository_id)"

test "Create ReleaseServer" do
  server = Beanstalk::API::ReleaseServer.new(
    :name        => "development",
    :local_path  => "/trunk",
    :remote_path => "/var/www/my_site",
    :remote_addr => "myftpserver.com",
    :protocol    => "ftp",
    :port        => 21,
    :login       => "username",
    :password    => "topsecret"
  )
  server.prefix_options = { :repository_id => $repository_id, :environment_id => $environment_id}
  server.save
  server
end

test "Update ReleaseServer" do
  server = Beanstalk::API::ReleaseServer.find_for_repository($release_server_id, $repository_id)
  server.prefix_options = { :repository_id => $repository_id }  
  server.local_path = "/"
  server.save
  server
end

test "Create ServerEnvironment" do
  env = Beanstalk::API::ServerEnvironment.new(
    :name        => "Macaroni",
    :automatic   => true,
    :branch_name => "master"
  )
  env.prefix_options = { :repository_id => $repository_id }
  env.save
  env
end

test "Update ServerEnvironment" do
  env = Beanstalk::API::ServerEnvironment.find_for_repository($environment_id, $repository_id)
  env.name = "Mascarpone"
  env.prefix_options = { :repository_id => $repository_id }
  env.save
  env
end

test "Create new Release" do
  r = Beanstalk::API::Release.new
  r.prefix_options = { :repository_id => $repository_id, :environment_id => $environment_id }
  r.release_server_id = $release_server_id
  r.revision = ""
  r.save
  r
end