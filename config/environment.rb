# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.11' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

#       This constant is used in the ucb_ccls_engine#Document
#       and other places like Amazon buckets
#       for controlling the path to documents.
RAILS_APP_NAME = 'ccls'

Rails::Initializer.run do |config|

	config.gem 'jakewendt-simply_sessions'
	config.gem 'jakewendt-simply_authorized'
	config.gem 'jakewendt-html_test'
	config.gem 'jakewendt-rails_extension'

	config.plugin_paths = [
		File.expand_path(File.join(File.dirname(__FILE__),'../..'))
	]
	config.plugins = [:simply_discussable]

	config.frameworks -= [:active_resource]

	config.routes_configuration_file = File.expand_path(
		File.join(File.dirname(__FILE__),'..','test/config/routes.rb'))

	config.autoload_paths += [
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/models')),
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/controllers'))
	]

	config.view_path = [
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/views'))
	]

	if RUBY_PLATFORM =~ /java/
		#	I'm surprised that I don't need this in my apps.
		config.gem 'activerecord-jdbcsqlite3-adapter',
			:lib => 'active_record/connection_adapters/jdbcsqlite3_adapter',
			:version => '~>0.9'
		#	1.0.1 is for rails 3 I think
		config.gem 'jdbc-sqlite3', :lib => 'jdbc/sqlite3'
		config.gem 'jruby-openssl', :lib => 'openssl'
	else
		config.gem 'sqlite3'
	end
	
end
