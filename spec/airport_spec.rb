require 'spec_helper'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context "airport capacity" do
    # two good tests
    it "should have a default capacity" do
      expect(airport.capacity).to eq(10)
    end

    it "should have a capacity of 6" do
      airport = Airport.new(capacity: 6)
      expect(airport.capacity).to eq(6)
    end
  end

  context "landing and taking off" do

    # Fails out of the box
    it "plane can land" do
      airport.land(plane)
      expect(airport.planes).to eq([plane])
      # a better option: expect(airport.plane_count).to eq(1)
    end

    # fails out of the box
    it "plane can take off" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to eq([])
      # it would be better to do airport.empty?
    end
  end

  context "traffic control" do
    it "plane cannot land if airport is full" do
      # a better way would be to land 10 planes
      # and then check that the eleventh raises an error
      # because this test would pass even if the airport
      # throwed an exception every single time you landed a plane
      expect { 11.times {airport.land(plane)} }.to raise_error
    end
  end

  context "weather conditions" do
    # This test fails out of the box.
    # Tests should always pass when you check out the project
    it "plane cannot land if weather is stormy" do
      airport.stub(:stormy_weather?) { true }
      expect{airport.land(plane)}.to raise_error
    end
  end
end