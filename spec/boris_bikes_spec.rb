require 'docking_station'
require 'bike'

describe DockingStation do

  describe'#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
  end
end
  describe'#release_bike' do
    it 'Has no bikes' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
end

  it { is_expected.to respond_to :release_bike }

  it 'releases a working bike' do
    bike = Bike.new
    expect(bike).to be_working
    end

it { is_expected.to respond_to(:dock).with(1).argument}

it { is_expected.to respond_to :bike }

describe "#dock" do

it 'Docks a bike' do
  bike = Bike.new
  expect(subject.dock(bike).pop).to eq bike
end

it 'Raises an error when bike capacity is full' do
  20.times do subject.dock(Bike.new) end
  expect { subject.dock(Bike.new) }.to raise_error "Capacity is full"
end

end

end
