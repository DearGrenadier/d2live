require 'tempfile'

class RegisterTeamWorker
  include Sidekiq::Worker
  CONTENT_URL = 'http://api.steampowered.com/ISteamRemoteStorage/GetUGCFileDetails/v1/'

  def perform(team_id)
    team_raw = DOTA_CLIENT.teams(after: team_id, limit: 1).first.raw
    logo = team_raw.fetch('logo')
    response = Faraday.new(url: CONTENT_URL).get do |request|
      request.params['ugcid'] = logo
      request.params['appid'] = 570
      request.params['key'] = ENV.fetch('STEAM_API_KEY')
    end

    logo_url = JSON.parse(response.body).dig('data', 'url')
    logo_response = Faraday.new(url: logo_url).get
    tempfile = Tempfile.new(encoding: 'ascii-8bit')
    tempfile.write(logo_response.body)
    Team.create!(id: team_id, raw: team_raw, logo: tempfile)
    tempfile.unlink
  end
end