class League < ApplicationRecord
  validates :id, uniqueness: true

  def name
    raw.fetch('name')
  end
end
