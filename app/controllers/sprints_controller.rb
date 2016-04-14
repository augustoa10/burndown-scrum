class SprintsController < ApplicationController
  def index
    sprint = Sprint.last

    points_to_burn = process_points_to_burn(sprint)
    burned_points = process_burned_points(sprint)

    @goals = [
      { name: 'Burndown Line', data: points_to_burn, discrete: true },
      { name: 'Burndown Points', data: burned_points, discrete: true }
    ]
  end

  def process_points_to_burn(sprint)
    sprint_start_date = sprint.start_date.to_date
    sprint_end_date = sprint.end_date.to_date
    sprint_days = sprint_end_date - sprint_start_date

    base_point = sprint.points / sprint_days.to_i
    current_point = 0

    points_to_burn = {}
    sprint_start_date.upto(sprint_end_date).each do |date|
      case
      when sprint.start_date.to_date.eql?(date)
        current_point = sprint.points
        points_to_burn[date] = current_point
      when sprint.end_date.to_date.eql?(date)
        points_to_burn[date] = 0
      else
        current_point = current_point - base_point
        points_to_burn[date] = current_point
      end
    end

    points_to_burn
  end

  def process_burned_points(sprint)
    sprint_start_date = sprint.start_date.to_date
    sprint_end_date = sprint.end_date.to_date

    burned_points = {}
    sprint_start_date.upto(sprint_end_date).each do |date|
      burned_points[date] = set_burned_points(sprint, date)
    end

    current_point = 0
    burned_points.each do |key, value|
      case
      when value.empty? && current_point.zero?
        current_point = sprint.points
      when value.empty?
        current_point
      else
        current_point = value.pop
      end

      burned_points[key] = current_point
    end
  end

  def set_burned_points(sprint, date)
    goals = sprint.goals.where(burned_at: date)
    goals.map(&:burned_points)
  end
end