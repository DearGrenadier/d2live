class Match < ApplicationRecord
  PRO_TIERS = {
    3 => 'Premier',
    2 => 'Professional'
  }.freeze

  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }

  def teams
    [raw.fetch('radiant_team'), raw.fetch('dire_team')].map { |team| team.fetch('team_name') }.join(' -vs- ')
  end

  def league
    raw.fetch('league_id')
  end

  def tier
    PRO_TIERS.fetch(raw.fetch('league_tier'))
  end
end
