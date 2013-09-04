require 'rake'
namespace :foo do 
	task :bar => :environment do 
		p ARGV
	end
end
