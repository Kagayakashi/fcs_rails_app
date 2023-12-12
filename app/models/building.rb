class Building < ApplicationRecord
  belongs_to :castle

  scope :by_order, -> { order(:order) }

  validates_uniqueness_of :type_id, scope: :castle_id
  validates_uniqueness_of :order, scope: :castle_id

  validates :type_id, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :food_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :wood_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :stone_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :iron_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :time_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :build_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_under_construction, inclusion: { in: [true, false] }
end
