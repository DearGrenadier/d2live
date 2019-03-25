# frozen_string_literal: true

require 'sidekiq-scheduler'

class FetchProPlayersInfoWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/proPlayers')
    data = JSON.parse response.body

    data.each do |player_raw|
      id = player_raw.delete('account_id')
      team = Team.find_by_id player_raw.delete('team_id')

      next if team.nil?

      upsert_player(id, team)
    end
  end

  private

  def upsert_player(id, team)
    player = Player.find_by_id id

    if player.nil?
      Player.create!(id: id, team: team, raw: player_raw)
    else
      player.update!(team: team, raw: player_raw)
    end
  end
end
