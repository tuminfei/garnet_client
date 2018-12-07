require "garnet_client/version"
require "garnet_client/engine"
require "garnet_client/utils/http_request"
require "garnet_client/service"
require "garnet_client/result"
require "garnet_client/railtie" if defined?(Rails)
require 'httparty'
require 'json'

module GarnetClient
  @version = GarnetClient::VERSION
  @content_type = 'application/json'
  @response_headers = {}
  @debug_mode = true

  # 接口路径
  API_POST_NOTICE_DEPOSIT_URL = '/api/garnet_client/notify_deposits'
  # 接口路径
  API_POST_NOTICE_WITHDRAW_URL = '/api/garnet_client/notify_withdraws'
  # 接口路径
  API_POST_NOTICE_TX_URL = '/api/garnet_client/notify_transactions'

  class<< self
    # mer_id 商户账号
    # mer_key 加密key
    attr_accessor :tenant_id, :debug_mode, :tenant_token
    attr_reader :api_base_url

    def api_base_url=(url)
      @api_base_url = url
    end

    def response_headers
      params = {"Content-Type" => @content_type,
                "tenant-id" => @tenant_id,
                "tenant-token" => @tenant_token
      }
      response_headers = params
      response_headers
    end


    def debug_mode?
      @debug_mode
    end
  end
end
