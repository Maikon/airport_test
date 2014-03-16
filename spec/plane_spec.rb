require 'spec_helper'

describe Plane do

  it 'should be flying by default' do
    expect(Plane.new).to be_true
  end

  it 'should be able to land' do
    plane = Plane.new
    plane.land
    expect(plane.flying).to be_false
  end

  it 'should be able to take off' do
    plane = Plane.new
    plane.land
    plane.take_off
    expect(plane.flying).to be_true
  end
end
