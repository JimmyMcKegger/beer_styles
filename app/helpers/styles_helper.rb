# frozen_string_literal: true

module StylesHelper
  def style_description(style)
    if style.overall_impression.present?
      content_tag(:p, style.overall_impression, class: 'card-text')
    else
      content_tag(:p, 'No description available.', class: 'card-text text-muted')
    end
  end
end
