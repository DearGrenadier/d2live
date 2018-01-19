class RegiseterFinishedMatchWorker
  include Sidekiq::Worker

  def perform(match)
    match.update!(finished: true)
    MatchEndNotification.new(match).send
  end
end