Rails.application.routes.draw do
    mount Lesli::Engine => "/lesli"
    #mount LesliBell::Engine => "/bell"
    #mount LesliBabel::Engine => "/babel"
end
