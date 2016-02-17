team  = Team.create( name: 'Fake Team' )

sprint = Sprint.create(
  team: team,
  name: 'Fake Sprint',
  points: 100,
  open: true,
  start_date: Date.today,
  end_date: Date.today.end_of_month,
)

goals_list = [
  [10, Date.today + 1],
  [11, Date.today + 2],
  [12, Date.today + 3],
  [13, Date.today + 4],
  [14, Date.today + 5],
]

goals_list.each do |points, burned_at|
  Goal.create(sprint: sprint, points: points, burned_at: burned_at )
end