# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team

  def name
    raw.fetch('name')
  end
end
