# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    @chats_count = Chat.count
    @matches_count = Match.count
    @leagues_count = League.count
    @live_matches = Match.live
    @finished_matches = Match.finished.last(10)
    @last_commit_message = `git log -1 --pretty=%B`
  end
end
