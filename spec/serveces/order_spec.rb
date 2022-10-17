require 'rails_helper'

RSpec.describe State, type: :class do
  it "return success order states" do
    region = Region.create(name: 'Region Fake', initials: 'RF')
    5.times do |index|
      State.create(region: region, name: "name_#{index}", initials: index)
    end

    order = Order.new
    list = order.order_states
    p list: list

    list_first = list.first
    list_last = list.last
    expect(list_first["formatted_name"]). to eq("name_0 - 0")
    expect(list_last["formatted_name"]). to eq("name_4 - 4")
  end
end