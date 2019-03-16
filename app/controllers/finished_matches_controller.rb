# frozen_string_literal: true

class FinishedMatchesController < ApplicationController
  def index
    @finished_matches_count = Match.finished.count
    @recent_matches = Match.finished.last(10).reverse
  end

  def show
    @match = Match.find(params.fetch(:id))

    respond_to do |format|
      kit = IMGKit.new(render_to_string('show.html.erb'), width: 640)
      kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/application.css"

      format.png do
        send_data(kit.to_png, type: 'image/png', disposition: 'inline')
      end

      format.html { render(:show, layout: false) }
    end
  end
end
