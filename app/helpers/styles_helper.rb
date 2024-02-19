# frozen_string_literal: true

module StylesHelper
  def style_description(style)
    sections = {
      'Overall Impression' => style.overall_impression,
      'Appearance' => style.appearance,
      'Aroma' => style.aroma,
      'Flavor' => style.flavor,
      'Mouthfeel' => style.mouthfeel,
      'Comments' => style.comments,
      'History' => style.history,
      'Tags' => style.tags
    }

    html = ''
    sections.each_with_index do |(title, content), index|
      next if content.blank?

      collapse_id = "styleDetail#{index}"
      html += content_tag(:div, class: 'accordion-item') do
        header = content_tag(:h2, class: 'accordion-header', id: "heading#{index}") do
          content_tag(:button, title, class: 'accordion-button collapsed',
                                      'data-bs-toggle': 'collapse', 'data-bs-target': "##{collapse_id}",
                                      'aria-expanded': 'false', 'aria-controls': collapse_id)
        end

        body = content_tag(:div, id: collapse_id, class: 'accordion-collapse collapse',
                                 'aria-labelledby': "heading#{index}", 'data-bs-parent': '#accordionStyleDescription') do
          content_tag(:div, content, class: 'accordion-body')
        end

        header + body
      end
    end

    content_tag(:div, html.html_safe, class: 'accordion', id: 'accordionStyleDescription')
  end
end
