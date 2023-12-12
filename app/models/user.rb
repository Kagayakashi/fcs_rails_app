class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :rememberable
  
  belongs_to :race
  has_many :castles, dependent: :destroy
  has_one :main_castle, -> { where(is_main: true) }, class_name: 'Castle'

  # Use :name as the authentication key
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: Devise.email_regexp, message: 'invalid email format' }
end
