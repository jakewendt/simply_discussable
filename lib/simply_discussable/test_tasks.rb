module SimplyDiscussable;end
namespace :test do
	namespace :units do
		Rake::TestTask.new(:simply_discussable => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/discussable/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
	namespace :functionals do
		Rake::TestTask.new(:simply_discussable => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/discussable/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
end
Rake::Task['test:functionals'].prerequisites.unshift(
	"test:functionals:simply_discussable" )
Rake::Task['test:units'].prerequisites.unshift(
	"test:units:simply_discussable" )

#	I thought of possibly just including this file
#	but that would make __FILE__ different.
#	Hmmm

#
#	used in simply_helpful's rake test:coverage to run gem's 
#		tests in the context of the application
#
@gem_test_dirs ||= []
@gem_test_dirs << File.expand_path(File.join(File.dirname(__FILE__),
	'/../../test/unit/discussable/'))
@gem_test_dirs << File.expand_path(File.join(File.dirname(__FILE__),
	'/../../test/functional/discussable/'))

