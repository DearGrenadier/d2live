# frozen_string_literal: true

class Match < ApplicationRecord
  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }
  # has_one :draft

  # has_many :bans
  # has_many :picks

  def league_name
    League.find_by_id(raw.fetch('league_id'))&.name
  end

  def tier
    League.find_by_id(raw.fetch('league_id'))&.tier
  end

  def radiant
    Team.find_by_id raw['team_id_radiant']
  end

  def dire
    Team.find_by_id raw['team_id_dire']
  end

  def radiant_picks
    Pick.radiant.where(match_id: id)
  end

  def radiant_bans
    Ban.radiant.where(match_id: id)
  end

  def dire_picks
    Pick.dire.where(match_id: id)
  end

  def dire_bans
    Ban.dire.where(match_id: id)
  end
end
