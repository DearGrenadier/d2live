# frozen_string_literal: true

class FinishedMatchesController < ApplicationController
  def index
    @finished_matches_count = Match.finished.count
    @worker_log = `tail -n 30 log/#{Rails.env}_#{TrackFinishedMatchesWorker.name.underscore}.log`
  end
end
