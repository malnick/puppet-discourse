require 'spec_helper'
describe 'discourse' do

  context 'with defaults for all parameters' do
    it { should contain_class('discourse') }
  end
end
