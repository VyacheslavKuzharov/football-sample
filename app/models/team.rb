class Team < ApplicationRecord

  has_many :players
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :guest_matches, class_name: 'Match', foreign_key: 'guest_team_id'
  has_many :scores
end
