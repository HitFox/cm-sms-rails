module CmSms
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      def run_other_generators
        generate "cm_sms:config"
      end
    end
  end
end