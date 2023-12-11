class Citadel < ApplicationRecord
  belongs_to :castle

  validates :name, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :tree_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :stone_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :iron_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :build_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :building_in_progress, inclusion: { in: [true, false] }
end
