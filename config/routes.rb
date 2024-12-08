
Rails.application.routes.draw do
  resource :welcome, only: [:show]
  root to: "welcomes#show"

  # Mount login at root
  Lesli::Routing.login
  Lesli::Routing.standard_engines
end
