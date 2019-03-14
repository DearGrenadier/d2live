# frozen_string_literal: true

class FinishedMatchesController < ApplicationController
  def index
    @finished_matches_count = Match.finished.count
    @recent_matches = Match.finished.last(10).reverse
  end
end
