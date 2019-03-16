# frozen_string_literal: true

class Match < ApplicationRecord
  scope :live, -> { where(finished: false) }
  scope :finished, -> { where(finished: true) }

  def league_name
    League.find_by_id(raw.fetch('league_id'))&.name
  end

  def tier
    League.find_by_id(raw.fetch('league_id'))&.tier
  end

  def radiant
    Team.find raw['team_id_radiant']
  end

  def dire
    Team.find raw['team_id_dire']
  end
end
