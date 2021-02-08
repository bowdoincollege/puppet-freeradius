require 'spec_helper'
require 'facter/freeradius_version'

describe 'freeradius_version', type: :fact do
  before :each do
    Facter.clear
    allow(Facter::Core::Execution).to receive(:exec).with('radiusd -v').and_return('FreeRADIUS Version 3.0.21')
  end

  it 'sets freeradius_version' do
    expect(Facter.fact(:freeradius_version).value).to eq('3.0.21')
  end

  it 'sets freeradius_maj_version' do
    expect(Facter.fact(:freeradius_maj_version).value).to eq('3')
  end
end
