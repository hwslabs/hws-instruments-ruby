# frozen_string_literal: true

require 'hws-connectors'

module Hws
  module Instruments # :nodoc:
    module Models # :nodoc:
      require 'lsuuid'
      require 'hws-instruments/models/instrument_config'
      require 'hws-instruments/models/instrument'
    end

    module Executors
      module Hypto # :nodoc:
        require 'hws-instruments/executors/hypto/virtual_account'
        require 'hws-instruments/executors/hypto/payouts'
      end
    end

    module Exceptions
      require 'hws-instruments/exceptions/exceptions'
    end

    def self.create_instrument_config(*args)
      Models::InstrumentConfig.create_config(*args)
    end
  end
end

require 'hws-instruments/railtie' if defined?(Rails)
