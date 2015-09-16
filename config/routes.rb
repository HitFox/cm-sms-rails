CmSmsRails::Engine.routes.draw do
  
  get 'cm-sms/status', to: 'webhooks#status'
  
end
