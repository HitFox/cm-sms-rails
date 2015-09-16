require 'cm_sms/message_delivery'

module CmSms
  module MessageDeliveryRefinement
    refine MessageDelivery do
      def deliver_later!(options={})
        enqueue_delivery :deliver_now!, options
      end

      def deliver_later(options={})
        enqueue_delivery :deliver_now, options
      end
      
      private

      def enqueue_delivery(delivery_method, options = {})
        raise 'Please use the deliver_now method, because you not have ActiveJob setted up right.' unless defined?(ActiveJob)
      
        args = @messenger.name, @message_method.to_s, delivery_method.to_s, *@args
        CmSms::DeliveryJob.set(options).perform_later(*args)
      end
    end
  end
end
