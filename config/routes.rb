
Rails.application.routes.draw do

    # mount lesli platform
    Lesli::Routing.mount if defined?(Lesli)
end
