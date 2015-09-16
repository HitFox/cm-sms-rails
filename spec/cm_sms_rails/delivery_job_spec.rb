require 'spec_helper'

RSpec.describe CmSmsRails::DeliveryJob do
  before do
    class NotificationMessenger < CmSms::Messenger
      def notification(to)
        content from: 'Sender Inc.', 
                to: to, 
                body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirood tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At v'
      end
    end
    
    CmSms.configure { |config| config.product_token = 'SOMETOKEN' }
    request = instance_double(CmSms::Request)
    allow(request).to receive(:perform).and_return(true)
    allow_any_instance_of(CmSms::Message).to receive(:request).and_return(request)
  end
  
  let(:delivery_job) { CmSmsRails::DeliveryJob.new }
  
  describe '#perform' do
    context 'all attributes are given' do
      it { expect(delivery_job.perform('NotificationMessenger', 'notification', 'deliver_now', '+41 44 222 22 33' )).to be true }
    end
  end
end