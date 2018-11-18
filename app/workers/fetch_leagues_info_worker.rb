# frozen_string_literal: true

require 'sidekiq-scheduler'

class FetchLeaguesInfoWorker
  include Sidekiq::Worker

  def perform
    DOTA_CLIENT.leagues.each do |league|
      league_id = league.raw.delete('leagueid')
      unless League.exists?(league_id)
        League.create!(id: league_id, raw: league.raw)
        logger.info "Save league #{league.raw.fetch('name')}"
      end
    end
  end
end
