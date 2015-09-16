Rails.application.routes.draw do
  mount CmSmsRails::Engine => "/sms"
end

CmSmsRails::Engine.routes.draw do
  get 'cm-sms/status', to: 'webhooks#status'
end