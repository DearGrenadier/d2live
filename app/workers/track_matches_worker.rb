# frozen_string_literal: true

require 'sidekiq-scheduler'

class TrackMatchesWorker
  include Sidekiq::Worker

  def perform
    live_matches = DOTA_CLIENT.live_matches
    return if live_matches.empty?

    pro_matches = live_matches.reject { |match| match.raw['league_node_id'].zero? }
    pro_match_ids = pro_matches.map do |pro_match|
      match_id = pro_match.raw.fetch('match_id')
      RegisterNewMatchWorker.perform_async(pro_match.raw) unless Match.exists?(match_id)
      match_id
    end
    register_finished_matches(pro_match_ids)
  end

  private

  def register_finished_matches(pro_match_ids)
    live_match_ids = Match.live.pluck(:id)
    finished_match_ids = live_match_ids - pro_match_ids
    Match.where(id: finished_match_ids).each do |match|
      RegisterFinishedMatchWorker.perform_async(match.id)
    end
  end
end
