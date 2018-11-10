# frozen_string_literal: true

set :output, 'log/whenever.log'
set :environment, :development

every 1.minute do
  rake 'track_matches'
end

every 1.day do
  rake 'fetch_leagues_info'
end
