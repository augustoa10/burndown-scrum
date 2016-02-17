class Goal < ActiveRecord::Base
  # Assossiation
  belongs_to :sprint

  # Validations
  validates :sprint, :points, :burned_at, presence: true

  # Callback
  before_save :set_burned_points

  private

  # Returns the points already burned in the sprint in relation to that goal
  # @return [Integer]
  def set_burned_points
    sprint = self.sprint
    sprint_burned_points = sprint.goals.map(&:points)
    sprint_burned_points = sprint_burned_points.empty? ? 0 : sprint_burned_points.inject(:+)
    self.burned_points = sprint.points - sprint_burned_points - points
  end
end
