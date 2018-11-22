# frozen_string_literal: true

require 'sidekiq-scheduler'

class FetchLeaguesInfoWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/leagues')
    json = JSON.parse response.body

    json.each do |league|
      league_id = league.delete('leagueid')
      unless League.exists?(league_id)
        League.create!(id: league_id, raw: league)
        logger.info "Save league #{league.fetch('name')}"
      end
    end
  end
end
