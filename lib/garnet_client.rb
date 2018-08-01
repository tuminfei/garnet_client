require "garnet_client/version"
require "garnet_client/utils/http_request"
require "garnet_client/service"
require "garnet_client/result"
require 'HTTParty'
require 'json'

module GarnetClient
  @version = GarnetClient::VERSION
  @content_type = 'application/json'
  @response_headers = {}

  class<< self
    # mer_id 商户账号
    # mer_key 加密key
    attr_accessor :tenant_id, :debug_mode
    attr_reader :api_base_url

    def api_base_url=(url)
      @api_base_url = url
    end

    def response_headers
      params = {"Content-Type" => @content_type,
                "tenant-id" => @tenant_id}
      response_headers = params
      response_headers
    end


    def debug_mode?
      @debug_mode
    end
  end
end
