require 'spec_helper'

describe 'Airport' do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, land: false, take_off: true }

  context 'airport capacity' do

    it 'should have zero planes when created' do
      expect(airport.planes).to eq([])
    end

    it 'should have default capacity' do
      expect(airport.capacity).to eq(6)
    end

    it 'should be able to set custom capacity' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq(10)
    end

  end

  context 'airport control' do

    before do
      airport.stub(:weather_stormy?).and_return(false)
    end

    it 'should be able to land a plane' do
      airport.parks(plane)
      expect(airport.planes).to eq([plane])
    end

    it 'should not allow a plane to land if capacity is full' do
      6.times { airport.parks(plane) }
      expect { airport.parks(plane) }.to raise_error
    end

    it 'should be able to allow plane to take off' do
      airport.parks(plane)
      airport.release(plane)
      expect(airport.planes).to eq([])
    end
  end

  context 'Weather conditions control' do

    it 'should not allow a plane to land if weather is stormy' do
      airport.stub(:weather_stormy?).and_return(true)
      expect { airport.parks(plane) }.to raise_error
    end

    it 'should not allow plane to take off if weather is stormy' do
      airport.stub(:weather_stormy?).and_return(true)
      expect { airport.release(plane) }.to raise_error
    end
  end
end
