class Order

  def order_states
    state_alphabetic = State.order(:name)
    state_alphabetic.map do |state|
      state.as_json(methods: [:formatted_name])
    end
  end
end

















# state_alphabetic = State.all.map do |state_name|
#   state_name.name
# end
# state_alphabetic = state_alphabetic.sort

# Region.all.each do |region|
#   puts "               "
#   puts "A região #{region.name} possui #{region.number_of_states} estados"
# end