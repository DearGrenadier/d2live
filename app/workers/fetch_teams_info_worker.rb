# frozen_string_literal: true

class FetchTeamsInfoWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/teams')
    data = JSON.parse response.body
    existing_team_ids = Team.pluck(:id)

    new_teams = data.reject do |team|
      team.fetch('team_id').in?(existing_team_ids)
    end

    save_teams(new_teams)
  end

  private

  def save_teams(teams)
    teams.each do |team_raw|
      id = team_raw.delete('team_id')
      Team.create!(id: id, raw: team_raw)
    end
  end
end
