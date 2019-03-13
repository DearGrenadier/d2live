# frozen_string_literal: true

require 'sidekiq-scheduler'

class FetchLeaguesInfoWorker
  include Sidekiq::Worker

  def perform
    logger = Logger.new("#{Rails.root}/log/#{Rails.env}_#{self.class.name.underscore}.log")
    logger.info '----- Performing leagues info fetching job -----'

    response = Faraday.get('https://api.opendota.com/api/leagues')
    data = JSON.parse response.body

    save_leagues(data) do |league|
      logger.info "Save league <<#{league.fetch('name')}>>"
    end
  end

  private

  def save_leagues(data, &_block)
    data.select { |league| league.fetch('tier').in? League::TIERS }.each do |league|
      league_id = league.delete('leagueid')
      unless League.exists?(league_id)
        League.create!(id: league_id, raw: league)
        yield(league) if block_given?
      end
    end
  end
end
