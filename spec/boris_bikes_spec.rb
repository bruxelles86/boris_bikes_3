require 'docking_station'
require 'bike'

describe Bike do

end

describe DockingStation do

  it 'Creates a capacity limit defined by user' do
    station = DockingStation.new 10
    expect(station.capacity).to eq 10
  end

  it 'Defaults capacity to 20 if not set by user' do
    station = DockingStation.new
    expect(station.capacity).to eq 20
  end

  describe'#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'returns error if no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'declines to release broken bikes' do
      subject.dock(Bike.new, "broken")
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end
end

  it { is_expected.to respond_to :release_bike }

  it 'releases a working bike' do
    bike = Bike.new
    p bike
    expect(bike).to be_working
    end

it { is_expected.to respond_to(:dock).with(1).argument}

it { is_expected.to respond_to :bikes }

  describe "#dock" do

      it 'Docks a bike' do
        bike = Bike.new
        expect(subject.dock(bike).pop).to eq bike
      end

      it 'Raises an error when bike capacity is full' do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
        expect{subject.dock(Bike.new)}.to raise_error "Capacity is full"
        end

      it 'Records returning bike as broken if broken' do
        subject.dock(Bike.new, "broken")
        expect(subject.bikes[0].working).to eq false
      end

      it 'Records returning bike as working if working' do
        subject.dock(Bike.new, "working")
        expect(subject.bikes[0].working).to eq true
      end

      it 'Docks bikes regardless of whether working or not' do
        subject.dock(Bike.new, "working")
        subject.dock(Bike.new, "broken")
        expect(subject.bikes[0].working).to eq true
        expect(subject.bikes[1].working).to eq false 
      end
  end

end
