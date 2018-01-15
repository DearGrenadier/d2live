class Match < ApplicationRecord
  PRO_TIER = 'Premier'

  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }

  def teams
    [raw.fetch('radiant_team'), raw.fetch('dire_team')].map { |team| team.fetch('team_name') }.join(' -vs- ')
  end
end
