# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    raw do
      {
        "rating": 1450.04,
        "wins": 79,
        "losses": 36,
        "last_match_time": 1_535_061_995,
        "name": 'VGJ Storm',
        "tag": 'VGJ.Storm',
        "logo_url": 'https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/5228654.png'
      }
    end
  end
end
