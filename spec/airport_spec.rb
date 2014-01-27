require 'spec_helper'

describe Airport do
let(:airport) { Airport.new }
let(:plane) { Plane.new }

  context "airport capacity" do

    it "should have a default capacity" do
      expect(airport.capacity).to eq(10)
    end

    it "should have a capacity of 6" do
      airport = Airport.new(capacity: 6)
      expect(airport.capacity).to eq(6)
    end
  end

  context "good weather conditions" do
    before do
      Airport.any_instance.stub(:stormy_weather?).and_return(false)
    end

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

  context "traffic control" do
    it "plane cannot land if airport is full" do
      expect { 11.times {airport.land(plane)} }.to raise_error
    end
  end

  context "bad weather conditions" do
    before do
      Airport.any_instance.stub(:stormy_weather?).and_return(true)
    end

    it "plane cannot land if weather is stormy" do
      expect { airport.land(plane) }.to raise_error
    end
  end
end