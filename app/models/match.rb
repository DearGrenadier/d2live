# frozen_string_literal: true

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
    League.find_by_id(raw.fetch('league_id'))&.tier
  end

  def radiant
    raw.fetch('team_name_radiant')
    # Team.find raw.dig('radiant_team', 'team_id')
  end

  def dire
    raw.fetch('team_name_dire')
    # Team.find raw.dig('dire_team', 'team_id')
  end

  def consistent?
    [radiant_team, dire_team].all?
  end
end
