require 'rails_helper'
require 'vcr'

RSpec.describe PopulateDatabase, type: :task do
  it "return success populated data base states", :vcr do
    popular = PopulateDatabase.new
    popular.perform
    expect(State.count). to eq(27)
    expect(Region.count). to eq(5)
    expect(City.count). to eq(5570)
  end
end
  # it "return success name state last" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(State.last.name). to eq('Distrito Federal' )
  # end
  #
  # it "return success name first last" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(State.first.name). to eq('Rondônia' )
  # end
  #
  # it "return success name city last" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(City.last.name). to eq('BRASILIA' )
  # end
  #
  # it "return success name city first" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(City.first.name). to eq("ALTA FLORESTA D'OESTE" )
  # end
  #
  # it "return success name region last" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(Region.last.name). to eq('Centro-Oeste')
  # end
  #
  # it "return success name region first" do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   expect(Region.first.name). to eq('Norte')
  # end
  #
  # it "return success " do
  #   popular = PopulateDatabase.new
  #   popular.perform
  #   state = State.first
  #   expect(state.region.name). to eq('Norte')
  # end

