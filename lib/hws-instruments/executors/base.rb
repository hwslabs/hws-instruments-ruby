# frozen_string_literal: true

module Hws::Instruments::Executors::Base
  def execute(action, instrument, options)
    actions = instrument.instrument_config.connector_actions.with_indifferent_access
    unless actions.present? && actions.key?(action)
      raise(
        Hws::Instruments::Exceptions::UnknownActionError,
        "Unknown action: #{action} for connector #{instrument.instrument_config.connector_id} | Allowed are: [#{actions}]"
      )
    end
    raise "Action disabled: #{action}" if instrument.allowed_actions.include?(action)

    Rails.logger.info "Instruments::Executors - Executing: action:#{action}, instrument: #{instrument}, options: #{options}"

    if self.methods.include?(action) || self.private_methods.include?(action)
      self.send(action.to_sym, instrument, options)
    else
      instrument.instrument_config.connector.send(action, options)
    end
  end
end
