class Sprint < ActiveRecord::Base
  # Association
  belongs_to :team
  has_many :goals

  # Validations
  validates :team, :points, :open, :start_date, :end_date, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
