require 'json'

module GarnetClient
  class GarnetNotifyController < ::ActionController::Base
    if _process_action_callbacks.any?{|a| a.filter == :verify_authenticity_token}
      # ActionController::Base no longer protects from forgery in Rails 5
      skip_before_filter :verify_authenticity_token
    end

    layout false

    def deposits
      rs = request.body.read
      code = '0'
      begin
        msg = JSON.parse(rs)

        notice = GarnetClient::NoticeDeposit.new
        notice.coin_type = msg['coin_type']
        notice.contract_address = msg['contract_address']
        notice.from = msg['from']
        notice.tx_hash = msg['tx_hash']
        notice.to = msg['to']
        notice.value = msg['value']
        notice.tx_timestamp = msg['timestamp']
        notice.status = msg['status']
        notice.notify_id = msg['notify_id']
        notice.error_msg = msg['error_msg']
        notice.save!

      rescue JSON::ParserError => e
        puts e.message
        puts e.backtrace.inspect
        code = '1'
      end

      render text: '{"status": {"code": ' + code + '}}'
    end

    def withdraws
      rs = request.body.read
      code = '0'
      begin
        msg = JSON.parse(rs)

        notice = GarnetClient::NoticeWithdraw.new
        notice.coin_type = msg['coin_type']
        notice.contract_address = msg['contract_address']
        notice.from = msg['from']
        notice.tx_hash = msg['tx_hash']
        notice.to = msg['to']
        notice.value = msg['value']
        notice.tx_timestamp = msg['timestamp']
        notice.status = msg['status']
        notice.notify_id = msg['notify_id']
        notice.error_msg = msg['error_msg']
        notice.save!

      rescue JSON::ParserError => e
        puts e.message
        puts e.backtrace.inspect
        code = '1'
      end

      render text: '{"status": {"code": ' + code + '}}'
    end

    def transactions
      rs = request.body.read
      msg = JSON.parse(rs)
      code = '0'

      begin
        notice = GarnetClient::NoticeTransaction.new
        notice.coin_type = msg['coin_type']
        notice.tx_id = msg['tx_id']
        notice.tx_hash = msg['tx_hash']
        notice.tx_timestamp = msg['timestamp']
        notice.from = msg['from']
        notice.to = msg['to']
        notice.value = msg['value']
        notice.contract_address = msg['contractAddress']
        notice.status = msg['status']
        notice.save!
      rescue JSON::ParserError => e
        puts e.message
        puts e.backtrace.inspect
        code = '1'
      end

      render text: '{"status": {"code": ' + code + '}}'
    end
  end
end