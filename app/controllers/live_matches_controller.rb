class LiveMatchesController < ApplicationController
  layout false

  def show
    @match = Match.find(params.fetch(:id))

    respond_to do |format|
      kit = IMGKit.new(render_to_string('show.html.erb'))

      format.jpg do
        send_data(kit.to_jpg, type: 'image/jpeg', disposition: 'inline')
      end

      format.png do
        send_data(kit.to_png, type: 'image/png', disposition: 'inline')
      end

      format.html do
        render :show
      end
    end
  end
end
