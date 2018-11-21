# frozen_string_literal: true

class RegisterFinishedMatchWorker
  include Sidekiq::Worker

  def perform(match_id)
    match = Match.find(match_id)
    logger.info "Register finished match ##{match.id}"
    match.update!(finished: true)
    MatchEndNotification.new(match).send
  end
end
