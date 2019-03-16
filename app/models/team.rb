# frozen_string_literal: true

class Team < ApplicationRecord
  # mount_uploader :logo, LogoUploader

  def name
    raw.fetch('name')
  end

  def logo_url
    raw.fetch('logo_url')
  end

  def tag
    raw.fetch('tag')
  end
end
