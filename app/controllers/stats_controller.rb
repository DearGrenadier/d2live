class StatsController < ApplicationController
  def index
    @chats_count = Chat.count
    @live_matches = Match.live
    @finished_matches = Match.finished.last(10)
  end
end