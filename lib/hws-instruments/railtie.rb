# frozen_string_literal: true

require 'hws-instruments'

# Expose rake tasks to users of the gem
class Hws::Instruments::Railtie < Rails::Railtie
  railtie_name :'hws-instruments'

  rake_tasks do
    path = File.expand_path(__dir__)
    Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
  end
end
