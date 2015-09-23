module CmSms
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
 
      def copy_initializer_file
        copy_file "initializer.rb", "config/initializers/cm_sms.rb"
      end
    end
  end
end