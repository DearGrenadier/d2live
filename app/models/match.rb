class Match < ApplicationRecord
  PRO_TIERS = {
    3 => 'Premier',
    2 => 'Professional'
  }.freeze

  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }

  def league_name
    League.find_by_id(raw.fetch('league_id'))&.name
  end

  def tier
    PRO_TIERS.fetch(raw.fetch('league_tier'))
  end

  def radiant_team
    Team.find raw.dig('radiant_team', 'team_id')
  end

  def dire_team
    Team.find raw.dig('dire_team', 'team_id')
  end

  def consistent?
    [radiant_team, dire_team].all?
  end
end
