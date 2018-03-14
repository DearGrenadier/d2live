class RegisterNewMatchWorker
  include Sidekiq::Worker

  def perform(match_raw)
    match_id = match_raw.delete('match_id')
    unless Match.exists? match_id
      match = Match.create!(id: match_id, raw: match_raw)
      [%w[radiant_team dire_team].map { |side| match_raw.dig(side,'team_id') }].each do |team_id|
        RegisterTeamWorker.new.perform(team_id) unless Team.exists? team_id
      end
      MatchStartNotification.new(match).send if match.consistent?
    end
  end
end