# frozen_string_literal: true

class Hws::Instruments::Models::Instrument < ActiveRecord::Base # :nodoc:
  belongs_to :instrument_config

  def execute(action:, options: {})
    Rails.logger.debug("Instrument.execute(action: #{action}, options: #{options})")
    self.instrument_config.executor.execute(action, self, options)
  end
end
