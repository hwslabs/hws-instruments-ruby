# frozen_string_literal: true

=begin
  Instrument Config:
  - connector_id: Hws::Connectors::Hypto::VirtualAccount
  - executor_id: Hws::Instruments::Executors::Hypto::VirtualAccount
  - connector_actions:
      {'action:send_to_bank': Hws::Connector::Payout::SendToBankRequest, ..}

  Instrument:
  - value:
=end

# Hws::Connectors::Dto::PayoutRequest

class Hws::Instruments::Executors::Hypto::Payouts # :nodoc:
  require 'hws-instruments/executors/base'
  extend Hws::Instruments::Executors::Base

  class << self
    private

    def send_to_bank_account(instrument, options)
      options['beneficiary'] = Hws::Connectors::Dto::AccountDetail.new(options.delete('beneficiary').symbolize_keys)
      req = Hws::Connectors::Dto::PayoutRequest.new(options.symbolize_keys)
      instrument.instrument_config.connector.send_to_bank_account(request: req)
    end

    def send_to_upi_id(instrument, options)
      options['beneficiary'] = Hws::Connectors::Dto::AccountDetail.new(options.delete('beneficiary').symbolize_keys)
      req = Hws::Connectors::Dto::PayoutRequest.new(options.symbolize_keys)
      instrument.instrument_config.connector.send_to_upi_id(request: req)
    end

    def status(instrument, options)
      instrument.instrument_config.connector.status(reference_number: options[:reference_number])
    end
  end
end
