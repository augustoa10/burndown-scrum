class SprintsController < ApplicationController
  def index
    @sprint = Sprint.last
    @goals = { name: "Sprint Total Points #{ rand(100) }", data: @sprint.goals.group_by_week(:created_at, week_start: :mon).count }
  end
end