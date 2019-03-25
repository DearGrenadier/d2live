# frozen_string_literal: true

class Ban < ApplicationRecord
  belongs_to :hero

  scope :radiant, -> { where(radiant: true) }
  scope :dire, -> { where(radiant: false) }

  validates :hero_id, uniqueness: { scope: :match_id }
end
