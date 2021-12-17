# frozen_string_literal: true

require 'hws-instruments/models/base'

class Hws::Instruments::Models::InstrumentConfig < Hws::Instruments::Models::Base # :nodoc:
  has_many :instruments

  MANDATORY_FIELDS = %I[connector_id executor_id connector_credentials connector_actions].freeze

  def self.create_config(params)
    raise 'Missing mandatory param' unless params.keys.all? { |x| MANDATORY_FIELDS.include?(x) }

    begin
      unless Object.const_defined?(params[:connector_id])
        raise Hws::Instruments::Exceptions::UnknownEntityError, "Connector not found: #{params[:connector_id]}"
      end
    rescue NameError => _e
      raise Hws::Instruments::Exceptions::UnknownEntityError, "Connector not found: #{params[:connector_id]}"
    end

    begin
      unless Object.const_defined?(params[:executor_id])
        raise Hws::Instruments::Exceptions::UnknownEntityError, "Executor not found: #{params[:executor_id]}"
      end
    rescue NameError => _e
      raise Hws::Instruments::Exceptions::UnknownEntityError, "Executor not found: #{params[:executor_id]}"
    end

    self.create(params)
  end

  def create_instrument(_external_identifier = nil)
    instrument = self.instruments.create
    instrument.execute(action: :create)
  end

  def connector
    unless Object.const_defined?(self.connector_id)
      raise "Invalid connector configuration. conn_id: #{self.connector_id}"
    end

    self.connector_id.constantize.new(self.connector_credentials)
  end

  def executor
    raise "Invalid instrument executor with id: #{self.executor_id}" unless Object.const_defined?(self.executor_id)

    self.executor_id.constantize
  end
end
