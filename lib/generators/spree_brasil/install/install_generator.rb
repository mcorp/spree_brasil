module SpreeBrasil
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false
      class_option :auto_run_i18n, :type => :boolean, :default => true

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_brasil\n"
        append_file 'app/assets/javascripts/admin/all.js', "//= require admin/spree_brasil\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_brasil\n", :before => /\*\//, :verbose => true
        inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_brasil\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_brasil'
      end

      def run_i18n
        run_i = options[:auto_run_i18n] || ['', 'y', 'Y'].include?(ask 'Would you like to run the i18n generator? [Y/n]')
        if run_i
          run 'rails g spree_i18n:install'
        else
          puts 'skipping rails g spree_i18n:install'
        end
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
