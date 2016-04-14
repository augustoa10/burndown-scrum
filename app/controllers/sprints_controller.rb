class SprintsController < ApplicationController
  def index
    @sprint = Sprint.last

    burned_points = { @sprint.start_date => @sprint.points }
    @goals = @sprint.goals.each do |goal|
      burned_points[goal.burned_at] = goal.burned_points
    end

    @goals = [
      { name: "Sprint Line", data: burned_points },
      { name: "Sprint  Burn Line", data: { @sprint.start_date => @sprint.points, @sprint.end_date => 0 } }
    ]
  end
end