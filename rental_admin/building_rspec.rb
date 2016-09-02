require_relative "rental_administration"

describe 'building' do
  let(:rental){Rental_builder.new}
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

end