require 'spec_helper'

describe Airport do
let(:airport) { Airport.new }
let(:plane) { Plane.new }

  context "airport capacity" do

    it "should have a default capacity" do
      expect(airport.capacity).to eq(15)
    end

    it "have a capacity of 6" do
      airport = Airport.new(capacity: 6)
      expect(airport.capacity).to eq(6)
    end
  end

  context "landing and taking off" do

    it "plane can land" do
      airport.land(plane)
      expect(airport.planes).to eq([plane])
    end

    it "plane can take off" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq([])
    end
  end



end