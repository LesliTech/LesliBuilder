Rails.application.routes.draw do
    mount Lesli::Engine => "/"
    mount LesliAdmin::Engine => "/admin" if defined?(LesliAdmin)
    mount LesliVault::Engine => "/vault" if defined?(LesliVault)
    mount LesliBabel::Engine => "/babel" if defined?(LesliBabel)
    mount LesliBell::Engine => "/bell" if defined?(LesliBell)
end
