class Team < ActiveRecord::Base
  # Association
  has_many :sprints

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
