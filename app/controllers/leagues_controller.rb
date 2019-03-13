# frozen_string_literal: true

class LeaguesController < ApplicationController
  def index
    @leagues_count = League.count
    @worker_log = `tail -n 30 log/#{Rails.env}_#{FetchLeaguesInfoWorker.name.underscore}.log`
  end
end
