# frozen_string_literal: true

FactoryBot.define do
  factory :league do
    raw do
      {
        banner: 'econ/leagues/subscriptions_esport_btv__asus_dota2_tournament_ingame',
        name: 'eSPORT BTV : ASUS DOTA2 Tournament',
        ticket: 'econ/leagues/subscriptions_esport_btv__asus_dota2_tournament',
        tier: 'amateur'
      }
    end
  end
end
