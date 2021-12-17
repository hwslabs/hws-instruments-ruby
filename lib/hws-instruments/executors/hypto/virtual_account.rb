# frozen_string_literal: true

# Executor for Hypto Virtual account module
class Hws::Instruments::Executors::Hypto::VirtualAccount
  require 'hws-instruments/executors/base'
  extend Hws::Instruments::Executors::Base

  class << self
    private

    def create(instrument, _)
      resp = instrument.instrument_config.connector.create(
        request: Hws::Connectors::Dto::VirtualAccountRequest.new(reference_number: instrument.id)
      )
      instrument.update!(
        external_identifier: resp.beneficiary.account_number,
        value: { id: resp.meta[:id], va_num: resp.beneficiary.account_number, account_ifsc: resp.beneficiary.account_ifsc }
      )
      instrument
    end

    def fetch(instrument, _); end

    def update(instrument); end

    def activate(instrument, _)
      resp = instrument.instrument_config.connector.activate(reference_number: instrument.value['id'])
      instrument.update!(value: instrument.value.merge({ status: 'ACTIVE' })) if resp.status == 'ACTIVE'
    end

    def deactivate(instrument, _)
      resp = instrument.instrument_config.connector.deactivate(reference_number: instrument.value['id'])
      instrument.update!(value: instrument.value.merge({ status: 'INACTIVE' })) if resp.status == 'INACTIVE'
    end
  end
end
