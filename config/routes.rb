GarnetClient::Engine.routes.draw do
  post "notify_deposits" => "garnet_notify#deposits"
  post "notify_withdraws" => "garnet_notify#withdraws"
  post "notify_transactions" => "garnet_notify#transactions"
end