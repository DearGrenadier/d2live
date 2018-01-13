class StatsController < ApplicationController
  def index
    @chats_count = Chat.count
  end
end