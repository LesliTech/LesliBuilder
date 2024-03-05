
Rails.application.routes.draw do
  resource :welcome
  root to: "welcomes#show"

  mount Lesli::Engine => "/lesli" if defined?(Lesli)
  mount LesliDriver::Engine => "/driver" if defined?(LesliDriver)
  mount LesliLetter::Engine => "/letter" if defined?(LesliLetter)
  mount LesliAdmin::Engine => "/admin" if defined?(LesliAdmin)
  mount LesliAudit::Engine => "/audit" if defined?(LesliAudit)
  mount LesliGuard::Engine => "/guard" if defined?(LesliGuard)
  mount LesliBabel::Engine => "/babel" if defined?(LesliBabel)
  mount LesliBell::Engine => "/bell" if defined?(LesliBell)
  mount LesliSupport::Engine => "/support" if defined?(LesliSupport)
  mount LesliDashboard::Engine => "/dashboard" if defined?(LesliDashboard)
end
