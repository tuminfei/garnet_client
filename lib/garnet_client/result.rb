module GarnetClient
  class Result
    attr_accessor :raw, :msg

    RESULT_SUCCESS_FLAG = 0


    # TX 状态
    LV_TX_STATE = {
        '1' => '成功',
        '0' => '失败',
        '2'	=> 'Pending'
    }

    def initialize(result)
      self.raw = result.to_s
      self.msg = result
    end

    def success?
      @msg[0]['status']['code'] == RESULT_SUCCESS_FLAG
    end

    def service_msg
      @msg[0]['status']['message']
    end
  end
end