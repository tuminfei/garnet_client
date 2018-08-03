require 'logger'

module GarnetClient
  module Utils
    class HttpRequest

      DEFAULT_ERR_MSG = '{ "status": {"code": 1, "message": "其他错误"} }'

      #发送请求
      def self.send_post(service_path, query_params)
        api_url = "#{GarnetClient.api_base_url}#{service_path}"
        headers = GarnetClient.response_headers
        html_content = ''
        html_result = ''
        resp_err = nil

        begin
          response = HTTParty.post(api_url, :body =>JSON.dump(query_params), :headers => headers, timeout: 10)
          html_result = response.body
        rescue JSON::ParserError => e
          resp_err = e
        end

        if GarnetClient.debug_mode
          log_file = File.join(Rails.root, "log", "garnet_client.log")
          logger = Logger.new(log_file)
          logger.info('--------------GarnetClient DEBUG--------------')
          logger.info("URL:#{api_url.to_s}")
          logger.info("PARAMS:#{query_params.to_s}")
          logger.info("RESPONSE:#{html_result.force_encoding('UTF-8')}")
          logger.info("RESPONSE_ERR:#{resp_err}")
        end

        begin
          msg = JSON.parse(html_result)
        rescue JSON::ParserError => e
          html_content = html_result
          msg = JSON.parse(DEFAULT_ERR_MSG)
        end
        return msg, html_content
      end

      def self.send_get(service_path)
        api_url = "#{GarnetClient.api_base_url}#{service_path}"
        headers = GarnetClient.response_headers
        html_content = ''
        html_result = ''
        resp_err = nil

        begin
          response = HTTParty.get(api_url, :headers => headers, timeout: 10)
          html_result = response.body
        rescue JSON::ParserError => e
          resp_err = e
        end

        if GarnetClient.debug_mode
          log_file = File.join(Rails.root, "log", "garnet_client.log")
          logger = Logger.new(log_file)
          logger.info('--------------GarnetClient DEBUG--------------')
          logger.info("URL:#{api_url.to_s}")
          logger.info("RESPONSE:#{html_result.force_encoding('UTF-8')}")
          logger.info("RESPONSE_ERR:#{resp_err}")
        end

        begin
          msg = JSON.parse(html_result)
        rescue JSON::ParserError => e
          html_content = html_result
          msg = JSON.parse(DEFAULT_ERR_MSG)
        end
        return msg, html_content
      end
    end
  end
end