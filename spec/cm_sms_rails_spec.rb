require 'spec_helper'

RSpec.describe CmSmsRails do  
  it 'has a version number' do
    expect(CmSmsRails::VERSION).not_to be nil
    expect(CmSmsRails.version).not_to be nil
  end
end
