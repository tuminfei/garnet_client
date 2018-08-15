class CreateGarnetClientNotices < ActiveRecord::Migration
  def self.up
    create_table :garnet_client_notice_deposits do |t|
      t.string :coin_type
      t.string :contract_address
      t.string :from
      t.string :tx_hash
      t.string :to
      t.integer :value, :limit=>8
      t.integer :tx_timestamp
      t.integer :status
      t.string :notify_id
      t.string :error_msg
      t.timestamps
    end

    create_table :garnet_client_notice_withdraws do |t|
      t.string :coin_type
      t.string :contract_address
      t.string :from
      t.string :tx_hash
      t.string :to
      t.integer :value, :limit=>8
      t.integer :tx_timestamp
      t.integer :status
      t.string :notify_id
      t.string :error_msg
      t.timestamps
    end

    create_table :garnet_client_notice_transactions do |t|
      t.string :tx_id
      t.string :tx_hash
      t.integer :tx_timestamp
      t.string :from
      t.string :to
      t.integer :value, :limit=>8
      t.string :contract_address
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :garnet_client_notice_deposits
    drop_table :garnet_client_notice_withdraws
    drop_table :garnet_client_notice_transactions
  end
end