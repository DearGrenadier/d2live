# frozen_string_literal: true

require 'sidekiq-scheduler'

class FetchLeaguesInfoWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/leagues')
    data = JSON.parse response.body

    existing_league_ids = League.pluck(:id)
    new_leagues = data.select do |league|
      league.fetch('tier').in?(League::TIERS) && !league.fetch('leagueid').in?(existing_league_ids)
    end

    save_leagues(new_leagues)
  end

  private

  def save_leagues(leagues)
    leagues.each do |league|
      league_id = league.delete('leagueid')
      League.create!(id: league_id, raw: league)
    end
  end
end
