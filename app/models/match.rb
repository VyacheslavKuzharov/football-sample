class Match < ApplicationRecord

  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
  has_many :scores
end
