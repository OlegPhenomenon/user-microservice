task :settings do
  require 'config'
  require 'sequel'
  require_relative '../config/initializers/config'
  require_relative '../config/environment'

  # require File.expand_path(File.join(*%w[ config environment ]), File.dirname(__FILE__))
end

