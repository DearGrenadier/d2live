# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize

require 'sidekiq-scheduler'

class TrackNewMatchesWorker
  include Sidekiq::Worker

  def perform
    logger = Logger.new("#{Rails.root}/log/#{Rails.env}_#{self.class.name.underscore}.log")
    logger.info '----- Performing track new matches job -----'
    response = Faraday.get('https://api.opendota.com/api/live')
    data = JSON.parse response.body
    saved_league_ids = League.pluck(:id)

    new_matches = data.select do |match_raw|
      saved_league_ids.include?(match_raw.fetch('league_id')) && !Match.exists?(match_raw.fetch('match_id'))
    end

    save_matches(new_matches) { |match_id| logger.info("New match <<#{match_id}>> was saved") }
  end

  private

  def save_matches(matches, &_block)
    matches.each do |match_raw|
      match_id = match_raw.delete('match_id')
      Match.create!(id: match_id, raw: match_raw)
      yield match_id if block_given?
    end
  end
end
# rubocop:enable Metrics/AbcSize
