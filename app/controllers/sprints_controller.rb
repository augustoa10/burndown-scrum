class SprintsController < ApplicationController
  def index
    @sprint = Sprint.last
    @goals = { name: "Sprint Total Points #{ rand(100) }", data: @sprint.goals.count }
  end
end