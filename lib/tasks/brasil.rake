namespace :spree_brasil do
  namespace :seed do
    desc "seed database with Brasil states, zones, etc."
    task :create => :environment do
      require File.join(File.dirname(__FILE__), '..', '..', 'db', 'default', 'brasil.rb')
      puts "Done!"
    end
  end
end