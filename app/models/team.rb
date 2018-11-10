# frozen_string_literal: true

class Team < ApplicationRecord
  mount_uploader :logo, LogoUploader

  def name
    raw.fetch('name')
  end
end
