# frozen_string_literal: true

require 'open_dota_client'

class Hero < ApplicationRecord
  self.table_name = :heroes

  def img_url
    "#{OpenDotaClient::HOST_URL}#{raw.fetch('img')}"
  end

  def icon_url
    "#{OpenDotaClient::HOST_URL}#{raw.fetch('icon')}"
  end
end
