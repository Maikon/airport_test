require 'spec_helper'

describe Airport do
let(:airport) { Airport.new }

context 'ability to set airport capacity' do

  it 'should have a default capacity' do
    expect(airport.capacity).to eq(10)
  end

end

end