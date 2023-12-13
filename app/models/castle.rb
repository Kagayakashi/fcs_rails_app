class Castle < ApplicationRecord
  belongs_to :user

  has_many :buildings, dependent: :destroy
  accepts_nested_attributes_for :buildings

  has_one :citadel, -> { where(type_id: BuildingType.new(:citadel).to_i) }, class_name: 'Building'
  has_one :barracks, -> { where(type_id: BuildingType.new(:barracks).to_i) }, class_name: 'Building'
  has_one :militia_hq, -> { where(type_id: BuildingType.new(:militia_hq).to_i) }, class_name: 'Building'
  has_one :farm, -> { where(type_id: BuildingType.new(:farm).to_i) }, class_name: 'Building'
  has_one :sawmill, -> { where(type_id: BuildingType.new(:sawmill).to_i) }, class_name: 'Building'
  has_one :stone_mine, -> { where(type_id: BuildingType.new(:stone_mine).to_i) }, class_name: 'Building'
  has_one :iron_mine, -> { where(type_id: BuildingType.new(:iron_mine).to_i) }, class_name: 'Building'
  has_one :diplomatic_center, -> { where(type_id: BuildingType.new(:diplomatic_center).to_i) }, class_name: 'Building'
  has_one :defensive_wall, -> { where(type_id: BuildingType.new(:defensive_wall).to_i) }, class_name: 'Building'

  validates_uniqueness_of :x, scope: :y
  validates_uniqueness_of :is_main, scope: :user_id

  validates :name, presence: true
  validates :user, presence: true
  validates :x, presence: true
  validates :y, presence: true
  validates :food, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10000 }
  validates :wood, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10000 }
  validates :stone, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10000 }
  validates :iron, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10000 }
  validates :is_main, inclusion: { in: [true, false] }

  def ordered_buildings
    buildings.by_order
  end
end
