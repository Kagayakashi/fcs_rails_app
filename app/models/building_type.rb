# app/models/building_type.rb

class BuildingType
  TYPES = {
    unknown: { id: 0, name: 'Unknown', details: 'Unknown' },
    citadel: { id: 1, name: 'Citadel', details: 'Unlocks new possibilities' },
    barracks: { id: 2, name: 'Barracks', details: 'Training new troops' },
    militia_hq: { id: 3, name: 'Militia Headquarters', details: 'Studying and preparing new combat tactics' },
    farm: { id: 4, name: 'Farm', details: 'Resource gathering: food' },
    sawmill: { id: 5, name: 'Sawmill', details: 'Resource gathering: wood' },
    stone_mine: { id: 6, name: 'Stone Mine', details: 'Resource gathering: stone' },
    iron_mine: { id: 7, name: 'Iron Mine', details: 'Resource gathering: iron' },
    diplomatic_center: { id: 8, name: 'Diplomatic Center', details: 'Join or create new alliance' },
    defensive_wall: { id: 9, name: 'Defensive Wall', details: 'Enhances defense protection' }
  }.freeze

  attr_reader :type

  def initialize(type)
    @type = type.to_sym
  end

  def name
    TYPES[@type][:name]
  end

  def details
    TYPES[@type][:details]
  end

  def to_i
    TYPES[@type][:id]
  end

  def self.find_by_name(name)
    new(TYPES[name.to_sym][:id])
  end

  def self.find_by_id(id)
    type = TYPES.find { |_name, data| data[:id] == id.to_i }
    new(type&.first || :unknown)
  end
end
