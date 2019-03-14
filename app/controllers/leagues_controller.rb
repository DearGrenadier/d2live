# frozen_string_literal: true

class LeaguesController < ApplicationController
  def index
    @leagues_count = League.count
    @recent_leagues = League.last(10).reverse
  end
end
