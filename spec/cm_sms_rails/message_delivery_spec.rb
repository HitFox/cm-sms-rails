require 'spec_helper'
require 'cm_sms/message_delivery'
require 'cm_sms/request'

RSpec.describe CmSms::MessageDelivery do
  before do
    class NotificationMessenger < CmSms::Messenger
      def notification(to)
        content from: 'Sender Inc.', 
                to: to, 
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirood tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At v'
      end
    end
  end
  
  let(:message_delivery) { described_class.new(NotificationMessenger, :notification, '+41 44 222 22 33') }
  let(:message) { message_delivery.message }
  
  describe '#deliver_later' do
    specify { expect { message_delivery.deliver_later }.to enqueue_a(CmSmsRails::DeliveryJob).with('NotificationMessenger', 'notification', 'deliver_now', '+41 44 222 22 33') }
  end
  
  describe '#deliver_later!' do
    specify { expect { message_delivery.deliver_later! }.to enqueue_a(CmSmsRails::DeliveryJob).with('NotificationMessenger', 'notification', 'deliver_now!', '+41 44 222 22 33') }
  end
end