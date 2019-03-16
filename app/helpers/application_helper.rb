# frozen_string_literal: true

module ApplicationHelper
  IMAGE_DATA_URI = 'data:image/png;base64,%<data>s'

  def image_data_tag(url, alt: '')
    data = Base64.encode64(Faraday.get(url).body)
    src = format(IMAGE_DATA_URI, data: data)
    content_tag(:img, nil, src: src, alt: alt)
  end
end
