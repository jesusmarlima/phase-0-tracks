require_relative 'rental_controller'

describe 'rental_administration' do

  let(:rental) { Rental_controller.new }

  it 'setup database for the program' do
    expect{rental.initial_setup}.not_to raise_error
  end

  it 'insert buiding' do
    id, name, floors, apts_by_floors = nil, "White Rock", 5, 4
    @building = rental.insert_building(id ,name,floors,apts_by_floors)
    expect(@building).to be_instance_of(Building)
  end

  it 'insert apartment' do
    id, name, floors, apts_by_floors = nil,"White Rock", 5, 4
    @building = rental.insert_building(id, name,floors,apts_by_floors)
    number, rented , number_of_beds  = "2B", "false" , 3
    apartment = rental.insert_apartments(number,rented,number_of_beds,@building.id)
    expect(apartment).to be_instance_of(Apartment)
  end

  it 'create a building with apartments' do
    id, name , floors, apts_by_floors = nil,"Bed Rock", 5, 4
    @building = rental.create_building(id, name,floors,apts_by_floors)
    #5 floors and 4 apts by floor with create 20 apts
    expect(@building.apartments.length).to eq 20
  end

  it "prints building with one floor and 5 apts" do
    rental.initial_setup
    building = rental.create_building(nil, "New Buidling", 1, 3)
    apartments = building.all_apartments_in_floors[0].map(&:number)
    expect(apartments).to eq  ["1A","1B","1C"]
  end

  it "prints building with 2 floor and 5 apts" do
    rental.initial_setup
    building = rental.create_building(nil, "New Buidling", 2, 2)
    floor2 = building.all_apartments_in_floors[0].map(&:number)
    floor1 = building.all_apartments_in_floors[1].map(&:number)
    apartments = [floor2,floor1]
    expect(apartments).to eq [["2A","2B"], ["1A","1B"]]
  end


  # this code clean the database tests
  after(:example) do
    @building.clear if @building
    @apartments.each do |apartment|
      apartment.clear
    end if @apartments
  end

end