
namespace :db do
  desc 'Run seed database'
  task :seed => :settings do |t, args|
    seed_file = File.join(File.dirname(__FILE__), '..', '..', 'db', 'seeds.rb')
    load(seed_file) if File.exist?(seed_file)
  end
end