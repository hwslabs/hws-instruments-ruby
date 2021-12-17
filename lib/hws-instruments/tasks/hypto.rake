# frozen_string_literal: true

namespace :'hws-instruments' do # rubocop:disable Metrics/BlockLength
  namespace :hypto do # rubocop:disable Metrics/BlockLength
    desc 'Initializes a Hypto payouts instrument config in DB'
    task :payouts, [:api_token] => :environment do |_t, args|
      Hws::Instruments.create_instrument_config(
        connector_id: 'Hws::Connectors::Hypto::Payout',
        executor_id: 'Hws::Instruments::Executors::Hypto::Payouts',
        connector_credentials: args.to_h,
        connector_actions: {
          create: '', # Local action without connector call
          status: 'String',
          send_to_upi_id: 'Hws::Connectors::Dto::PayoutRequest',
          send_to_bank_account: 'Hws::Connectors::Dto::PayoutRequest'
        }
      )
    end

    desc 'Initializes a Hypto virtual accounts instrument config in DB'
    task :virtual_account, [:api_token] => :environment do |_t, args|
      Hws::Instruments.create_instrument_config(
        connector_id: 'Hws::Connectors::Hypto::VirtualAccount',
        executor_id: 'Hws::Instruments::Executors::Hypto::VirtualAccount',
        connector_credentials: args.to_h,
        connector_actions: {
          list: 'Hws::Connectors::Dto::ListVirtualAccountRequest',
          fetch: 'Hws::Connectors::Dto::FetchVirtualAccountRequest',
          create: 'Hws::Connectors::Dto::CreateVirtualAccountRequest',
          search: 'Hws::Connectors::Dto::SearchVirtualAccountRequest',
          status: 'Hws::Connectors::Dto::StatusRequest',
          update: 'Hws::Connectors::Dto::UpdateVirtualAccountRequest',
          activate: 'Hws::Connectors::Dto::ActivateVirtualAccountRequest',
          statement: 'Hws::Connectors::Dto::StatementRequest',
          deactivate: 'Hws::Connectors::Dto::DeactivateVirtualAccountRequest',
          send_to_upi_id: 'Hws::Connectors::Dto::SendToUpiIdRequest',
          send_to_bank_account: 'Hws::Connectors::Dto::SendToBankAccountRequest'
        }
      )
    end
  end
end
