current = File.dirname(__FILE__)

require(File.join(current, 'lib', 'base'))

Dir[File.join(current, 'lib', '*.rb')].each do |file|
  next if file == 'base.rb'
  require file
end
