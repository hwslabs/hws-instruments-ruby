# frozen_string_literal: true

require 'rails/generators/migration'
require 'rails/generators/active_record'

module Hws::Instruments
  class InstallGenerator < Rails::Generators::Base # :nodoc:
    include Rails::Generators::Migration

    source_root File.expand_path('templates', __dir__)

    def self.next_migration_number(path)
      ActiveRecord::Generators::Base.next_migration_number(path)
    end

    desc 'copying migrations to db/migrate'
    def copy_migrations
      migration_template 'migration.rb.erb', 'db/migrate/create_hws_instruments_tables.rb'

      puts '
        Note: Setup required instrument configs using appropriate rake tasks after applying migrations onto DB.
          Find more details here: https://github.com/hwslabs/hws-instruments-ruby#setup
      '
    end
  end
end
