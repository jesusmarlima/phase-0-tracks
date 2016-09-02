require_relative 'rental_administration'

describe 'rental_administration' do

  let(:rental) { Rental_builder.new }

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

  # this code clean the database tests
  after(:example) do
    @building.clear if @building
    @apartments.each do |apartment|
      apartment.clear
    end if @apartments
  end

end