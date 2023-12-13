# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Building types
citadel = BuildingType.new(:citadel)
barracks = BuildingType.new(:barracks)
militia_hq = BuildingType.new(:militia_hq)
farm = BuildingType.new(:farm)
sawmill = BuildingType.new(:sawmill)
stone_mine = BuildingType.new(:stone_mine)
iron_mine = BuildingType.new(:iron_mine)
diplomatic_center = BuildingType.new(:diplomatic_center)
defensive_wall = BuildingType.new(:defensive_wall)

# Clear
Building.destroy_all
puts "All buildings are deleted"

Castle.destroy_all
puts "All castles are deleted"

User.destroy_all
puts "All users are deleted"

Race.destroy_all
puts "All races are deleted"

# Races
race_human = Race.create(name: 'Humans')
puts "Race created: #{race_human.name}"

race_elf = Race.create(name: 'Elves')
puts "Race created: #{race_elf.name}"

race_dwarf = Race.create(name: 'Dwarves')
puts "Race created: #{race_dwarf.name}"

race_orc = Race.create(name: 'Orcs')
puts "Race created: #{race_orc.name}"

# Admin user
user = User.create(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'admin',
  race_id: race_human.id
)
puts "User created: #{user.name}, #{user.email}, #{user.race.name}"

# Admin castle
primary_castle = user.castles.create(
  name: 'Primary Castle',
  x: 1,
  y: 1,
  is_main: true,
  buildings_attributes: [
    {
      order: 1,
      type_id: citadel.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 2,
      type_id: barracks.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 3,
      type_id: militia_hq.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 4,
      type_id: farm.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 5,
      type_id: sawmill.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 6,
      type_id: stone_mine.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 7,
      type_id: iron_mine.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 8,
      type_id: diplomatic_center.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 9,
      type_id: defensive_wall.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
  ]
)
puts "Castle created: #{primary_castle.name}, X:#{sprintf('%03d', primary_castle.x)} Y:#{sprintf('%03d', primary_castle.y)}"

secondary_castle = user.castles.create(
  name: 'Secondary Castle',
  x: 10,
  y: 10,
  is_main: false,
  buildings_attributes: [
    {
      order: 1,
      type_id: citadel.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 2,
      type_id: barracks.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 3,
      type_id: militia_hq.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 4,
      type_id: farm.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 5,
      type_id: sawmill.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 6,
      type_id: stone_mine.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 7,
      type_id: iron_mine.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 8,
      type_id: diplomatic_center.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
    {
      order: 9,
      type_id: defensive_wall.to_i,
      food_requirement: 100,
      wood_requirement: 100,
      stone_requirement: 100,
      iron_requirement: 100,
      time_requirement: 60
    },
  ]
)
puts "Castle created: #{secondary_castle.name}, X:#{sprintf('%03d', secondary_castle.x)} Y:#{sprintf('%03d', secondary_castle.y)}"
