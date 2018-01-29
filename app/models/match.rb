class Match < ApplicationRecord
  PRO_TIERS = {
    3 => 'Premier',
    2 => 'Professional'
  }.freeze

  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }

  validates :id, uniqueness: true

  def teams
    [raw.fetch('radiant_team', {}), raw.fetch('dire_team', {})].map do |team|
      team.fetch('team_name', 'UNKNOWN')
    end.join(' -vs- ')
  end

  def league_name
    League.find_by_id(raw.fetch('league_id'))&.name
  end

  def tier
    PRO_TIERS.fetch(raw.fetch('league_tier'))
  end
end
