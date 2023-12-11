class Castle < ApplicationRecord
  belongs_to :user
  
  has_one :citadel, dependent: :destroy
  accepts_nested_attributes_for :citadel

  validates :name, presence: true
  validates :user, presence: true
end
