class RegisterNewMatchWorker
  include Sidekiq::Worker

  def perform(match_raw)
    match = Match.create!(id: match_raw.delete('match_id'), raw: match_raw)
    MatchStartNotification.new(match).send
  rescue
  end
end