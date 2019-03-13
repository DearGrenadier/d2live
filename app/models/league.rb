# frozen_string_literal: true

class League < ApplicationRecord
  TIERS = %w[premium professional amateur].freeze
  def name
    raw.fetch('name')
  end

  def tier
    raw.fetch('tier')
  end
end
