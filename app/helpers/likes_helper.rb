# frozen_string_literal: true

module LikesHelper
  def like_or_unlike(style, like)
    if like
      button_to 'Unlike', style_like_path(style, like), method: :delete, class: 'btn btn-secondary'
    else
      button_to 'Like', style_likes_path(style), class: 'btn btn-primary'
    end
  end
end
