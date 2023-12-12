# app/models/building_type.rb

class BuildingType
  TYPES = {
    citadel: 1,
    barracks: 2,
    militia_hq: 3,
    farm: 4,
    sawmill: 5,
    stone_mine: 6,
    iron_mine: 7,
    diplomatic_center: 8,
    defensive_wall: 9
  }.freeze

  attr_reader :type_id

  def initialize(type_id)
    @type_id = type_id.to_sym
  end

  def name
    TYPES.key(@type_id)
  end

  def to_i
    TYPES[@type_id]
  end

  def self.find_by_name(name)
    new(TYPES[name.to_sym])
  end
end