# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    raw do
      {
        "activate_time": 1_552_460_672,
        "average_mmr": 0,
        "building_state": 12_255_370,
        "deactivate_time": 1_552_463_056,
        "delay": 300,
        "dire_score": 16,
        "game_mode": 2,
        "game_time": 1272,
        "last_update_time": 1_552_462_720,
        "league_id": 10_558,
        "lobby_id": '26045624710550322',
        "lobby_type": 1,
        "players": [
          {
            "account_id": 165_086_162,
            "country_code": 'id',
            "fantasy_role": 1,
            "hero_id": 52,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Huppey',
            "team_id": 3_265_632,
            "team_name": 'PG.Barracx',
            "team_tag": 'BrX'
          },
          {
            "account_id": 153_727_297,
            "hero_id": 18
          },
          {
            "account_id": 166_832_118,
            "country_code": 'id',
            "fantasy_role": 2,
            "hero_id": 85,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'SPACEMAN',
            "team_id": 3_265_632,
            "team_name": 'PG.Barracx',
            "team_tag": 'BrX'
          },
          {
            "account_id": 237_201_026,
            "country_code": 'id',
            "fantasy_role": 4,
            "hero_id": 60,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Azur4',
            "team_id": 3_265_632,
            "team_name": 'PG.Barracx',
            "team_tag": 'BrX'
          },
          {
            "account_id": 359_068_880,
            "country_code": 'id',
            "fantasy_role": 1,
            "hero_id": 95,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Ifr1t!',
            "team_id": 3_265_632,
            "team_name": 'PG.Barracx',
            "team_tag": 'BrX'
          },
          {
            "account_id": 121_404_228,
            "country_code": 'id',
            "fantasy_role": 2,
            "hero_id": 27,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Xepher',
            "team_id": 6_187_626,
            "team_name": 'Tigers',
            "team_tag": 'Tigers'
          },
          {
            "account_id": 110_539_311,
            "country_code": '',
            "fantasy_role": 1,
            "hero_id": 96,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Velo',
            "team_id": 6_306_453,
            "team_name": 'WarriorsGaming.Unity',
            "team_tag": 'WG.Unity'
          },
          {
            "account_id": 70_388_657,
            "country_code": '',
            "fantasy_role": 0,
            "hero_id": 47,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": 'Dendi',
            "team_id": 6_187_626,
            "team_name": 'Tigers',
            "team_tag": 'Tigers'
          },
          {
            "account_id": 196_931_374,
            "country_code": 'vn',
            "fantasy_role": 4,
            "hero_id": 10,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": '458',
            "team_id": 4_817_649,
            "team_name": '496 Gaming',
            "team_tag": '496'
          },
          {
            "account_id": 87_196_890,
            "country_code": '',
            "fantasy_role": 2,
            "hero_id": 45,
            "is_locked": true,
            "is_pro": true,
            "locked_until": nil,
            "name": '1437',
            "team_id": 6_187_626,
            "team_name": 'Tigers',
            "team_tag": 'Tigers'
          }
        ],
        "radiant_lead": 9703,
        "radiant_score": 25,
        "series_id": 306_109,
        "server_steam_id": '90124234765538312',
        "sort_score": 9374,
        "spectators": 1374,
        "team_id_dire": 3_265_632,
        "team_id_radiant": 6_187_626,
        "team_logo_dire": '960847208278814427',
        "team_logo_radiant": '993512944601689027',
        "team_name_dire": 'PG.Barracx',
        "team_name_radiant": 'Tigers'
      }
    end

    trait :live do
      finished { false }
    end

    trait :finished do
      finished { true }
    end
  end
end
