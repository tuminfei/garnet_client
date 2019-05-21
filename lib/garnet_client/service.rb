module GarnetClient
  class Service
    # 获得一个地址
    def self.wallet_get_or_create_address(coin_type, user_id)
      service_path = "/wallet/#{coin_type}/get_or_create_address"
      post_params = {
          "user_id" => user_id
      }

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_post(service_path, post_params)
      msg
    end

    # 查询余额
    def self.wallet_get_balance(coin_type, address)
      service_path = "/wallet/#{coin_type}/balance/#{address}"

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_get(service_path)
      msg
    end

    # 查询热钱包余额
    def self.hot_wallet_get_balance(coin_type)
      service_path = "/wallet/#{coin_type}/hotbalance"

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_get(service_path)
      msg
    end

    # 查询gas余额
    def self.wallet_gas_get_balance(coin_type)
      service_path = "/wallet/#{coin_type}/gasbalance"

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_get(service_path)
      msg
    end

    # 发送一笔转账
    def self.tx_transfer(coin_type, source_id, from, to, value, eos_memo = nil)
      service_path = "/tx/#{coin_type}/transfer"
      from_address = from.nil? ? '' : from
      post_params = {
          "source_id" => source_id,
          "from" => from_address,
          "to" => to,
          "value" => value,
          "comments" => eos_memo
      }

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_post(service_path, post_params)
      msg
    end

    # 查询转账明细
    def self.tx_get_info(coin_type, tx_id)
      service_path = "/tx/#{coin_type}/#{tx_id}"

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_get(service_path)
      msg
    end

    # 查询交易hash
    def self.tx_get_hash_info(tx_hash)
      service_path = "/tx/in/#{tx_hash}"

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_get(service_path)
      msg
    end

    # 提交提现单
    def self.withdraw_create_order(user_id, to, coin_type, value, transfer_fee, description)
      service_path = "/withdraw/submit_order"
      post_params = {
          "user_id" => user_id,
          "to" => to,
          "coin_type" => coin_type,
          "value" => value,
          "transfer_fee" => transfer_fee,
          "description" => description
      }

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_post(service_path, post_params)
      msg
    end

    # import钱包
    def self.wallet_import_key(file_name, address, key_data, key_pwd, user_id)
      service_path = "/wallet/eth/import_key"
      post_params = {
          "file_name" => file_name,
          "address" => address,
          "key_data" => key_data,
          "key_pwd" => key_pwd,
          "user_id" => user_id
      }

      # 调用查询接口
      msg = GarnetClient::Utils::HttpRequest.send_post(service_path, post_params)
      msg
    end

  end
end
