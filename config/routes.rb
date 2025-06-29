
Rails.application.routes.draw do
    root to: "welcomes#show"
    resource :welcome, only: [:show]

    # mount lesli platform
    Lesli::Routing.mount if defined?(Lesli)
end
