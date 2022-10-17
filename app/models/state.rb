class State < ApplicationRecord
  has_many :cities
  belongs_to :region

  def number_of_cities
    "#{cities.count}"
  end

  def formatted_name
    "#{name} - #{initials}"
  end

  def region_name
    "#{region.name}"
  end
end
