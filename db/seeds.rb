# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


data = [
    {
        title: 'rostov',
        players: [
            { first_name: 'Alexey', last_name: 'Ionov'},
            { first_name: 'Roman', last_name: 'Eremenko'},
            { first_name: 'Eldor', last_name: 'Eldor'}
        ]
    },
    {
        title: 'zenith',
        players: [
            { first_name: 'Artem', last_name: 'Dzuba'},
            { first_name: 'Yury', last_name: 'Zhirkov'},
            { first_name: 'Serdar', last_name: 'Azmun'}
        ]
    },
    {
        title: 'Lokomotiv',
        players: [
            { first_name: 'Marinato', last_name: 'Guilerme'},
            { first_name: 'Igor', last_name: 'Denisov'},
            { first_name: 'Alexey', last_name: 'Miranchuk'}
        ]
    },
    {
        title: 'cska',
        players: [
            { first_name: 'Igor', last_name: 'Akenfeev'},
            { first_name: 'Fedor', last_name: 'Chalov'},
            { first_name: 'Mario', last_name: 'Fernandes'}
        ]
    },
    {
        title: 'spartak',
        players: [
            { first_name: 'Andrea', last_name: 'Shurle'},
            { first_name: 'Roman', last_name: 'Zobnin'},
            { first_name: 'Jordan', last_name: 'Larson'}
        ]
    }
]

data.each do |team|
  t = Team.create(club_title: team[:title])
  t.players.create(team[:players])
end


10.times do |i|
  home_team = Team.all.sample
  guest_team = Team.where.not(id: home_team.id).sample

  match = Match.create(started_at: Time.now + i.day, home_team_id: home_team.id, guest_team_id: guest_team.id )

  home_team.players.each do |player|
    match.scores.create(
        team_id: home_team.id,
        player_id: player.id,
        min_played: rand(45..90),
        goals: rand(0..2),
        assists: rand(0..5),
        yellow: rand(0..2)
    )
  end

  guest_team.players.each do |player|
    match.scores.create(
        team_id: guest_team.id,
        player_id: player.id,
        min_played: rand(45..90),
        goals: rand(0..2),
        assists: rand(0..3),
        yellow: rand(0..2)
    )
  end
end
