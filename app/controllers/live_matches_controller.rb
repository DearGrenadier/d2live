# frozen_string_literal: true

class LiveMatchesController < ApplicationController
  def index
    @live_matches_count = Match.live.count
    @live_matches = Match.live
  end

  def show
    @match = Match.find(params.fetch(:id))

    respond_to do |format|
      kit = IMGKit.new(render_to_string('show.html.erb'), disable_smart_width: true, width: 1280)
      kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/application.css"

      format.png do
        send_data(kit.to_png, type: 'image/png', disposition: 'inline')
      end

      format.html { render(:show, layout: false) }
    end
  end
end
