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

  before_save :set_default_requirements, if: :new_record?
  before_create :set_default_requirements
  after_update :update_construction_worker, if: -> { saved_change_to_build_time? && is_under_construction? }

  def level_up!
    return if self.level.eql? 10

    self.level += 1
    self.food_requirement *= 2
    self.wood_requirement *= 2
    self.stone_requirement *= 2
    self.iron_requirement *= 2
    self.time_requirement *= 2
    self.is_under_construction = false
    self.build_time = 0
    save
  end

  def level_down!
    return if self.level.zero?

    self.level -= 1
    self.food_requirement /= 2
    self.wood_requirement /= 2
    self.stone_requirement /= 2
    self.iron_requirement /= 2
    self.time_requirement /= 2
    self.is_under_construction = false
    self.build_time = 0
    save
  end

  private

  def set_default_requirements
    self.food_requirement = 100
    self.wood_requirement = 100
    self.stone_requirement = 100
    self.iron_requirement = 100
    self.time_requirement = 60
  end

  def update_construction_worker
    UpdateConstructionTimeWorker.perform_async(id)
  end
end
