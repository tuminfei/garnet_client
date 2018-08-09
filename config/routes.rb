GarnetClient::Engine.routes.draw do
  post "notify_deposits" => "notify#deposits"
  post "notify_withdraws" => "notify#withdraws"
  post "notify_transactions" => "notify#transactions"
end