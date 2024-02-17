# frozen_string_literal: true

module StylesHelper
  def style_description(style)
    if style.description.present?
      content_tag(:p, style.description, class: 'card-text')
    else
      content_tag(:p, 'No description available.', class: 'card-text text-muted')
    end
  end
end
