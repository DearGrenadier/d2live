# frozen_string_literal: true

class LiveMatchesController < ApplicationController
  def index
    @live_matches_count = Match.live.count
    @worker_log = `tail -n 30 log/#{Rails.env}_#{TrackNewMatchesWorker.name.underscore}.log`
  end

  def show
    @match = Match.find(params.fetch(:id))

    respond_to do |format|
      kit = IMGKit.new(render_to_string('show.html.erb'))

      format.png do
        send_data(kit.to_png, type: 'image/png', disposition: 'inline')
      end

      format.html do
        render :show, layout: false
      end
    end
  end
end
