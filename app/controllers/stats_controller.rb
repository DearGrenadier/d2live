# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    @chats_count = Chat.count
    @matches_count = Match.count
    @live_matches = Match.live
    @finished_matches = Match.finished.last(10)
  end
end
