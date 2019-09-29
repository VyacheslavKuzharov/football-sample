class Player < ApplicationRecord

  VALID_SCORES = %i[min_played goals assists yellow].freeze
  MATCHES_LIMIT = 5
  MIN_PLAYED_LIMIT = 76
  GOALS_LIMIT = 1
  ASSISTS = 2
  YELLOW_CARDS_LIMIT = 1

  belongs_to :team
  has_many :scores


  # выбрать Top-5 игроков по конкретному показателю в конкретной команде
  def self.top_5_by_score_and_team(score_type, team_id)
    top_5_players_by(score_type, team_id)
  end

  # и по всем командам в целом
  def self.top_5_by_score(score_type)
    top_5_players_by(score_type)
  end


  # отметить, что игрок выполнил такой-то показатель в матче
  def min_assists_in_match?(match_id)
    scores.where("match_id = (?) AND assists >= (?)", match_id, ASSISTS).any?
  end

  # проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды
  def score_achieved?(score)
    raise "Score #{score} is invalid!" unless VALID_SCORES.include?(score)

    ary = scores.order(created_at: :desc).first(MATCHES_LIMIT)
    send("#{score}_score_is_done?", ary)
  end

  private

  def self.top_5_players_by(score_type, team = nil)
    raise "Score #{score_type} is invalid!" unless VALID_SCORES.include?(score_type)

    players_scores = joins(:scores).select("players.*, sum(scores.#{score_type}) as score_sum")
    players_scores = players_scores.where(scores: { team_id: team }) if team
    players_scores.group('players.id').order('score_sum desc').limit(5)
  end

  def min_played_score_is_done?(ary)
    ary.find { |score| score.min_played >= MIN_PLAYED_LIMIT }.present?
  end

  def goals_score_is_done?(ary)
    ary.find { |score| score.goals >= GOALS_LIMIT }.present?
  end

  def assists_score_is_done?(ary)
    ary.find { |score| score.assists >= ASSISTS }.present?
  end

  def yellow_score_is_done?(ary)
    ary.find { |score| score.yellow >= YELLOW_CARDS_LIMIT }.present?
  end
end
