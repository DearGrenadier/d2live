# frozen_string_literal: true

class FetchHeroesInfoWorker
  include Sidekiq::Worker

  def perform
    response = Faraday.get('https://api.opendota.com/api/heroStats')
    data = JSON.parse response.body

    existing_hero_ids = Hero.pluck(:id)
    new_heroes = data.reject do |hero|
      hero.fetch('id').in?(existing_hero_ids)
    end

    save_heroes(new_heroes)
  end

  private

  def save_heroes(heroes)
    heroes.each do |hero_raw|
      id = hero_raw.delete('id')
      Hero.create!(id: id, raw: hero_raw)
    end
  end
end
