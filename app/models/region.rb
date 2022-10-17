class Region < ApplicationRecord
  has_many :states

  def number_of_states
    states.count
  end
end
