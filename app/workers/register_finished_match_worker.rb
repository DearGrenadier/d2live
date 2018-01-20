class RegisterFinishedMatchWorker
  include Sidekiq::Worker

  def perform(finished_match)
    finished_match.update!(finished: true)
    MatchEndNotification.new(finished_match).send
  end
end