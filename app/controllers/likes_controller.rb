# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :require_signin

  def create
    @style = Style.find_by!(slug: params[:style_id])
    @style.likes.create!(user: current_user)
    redirect_to @style
  end

  def destroy
    @style = Style.find_by!(slug: params[:style_id])
    @like = current_user.likes.find_by(style_id: @style.id)

    if @like.present?
      @like.destroy
    end


    redirect_to @style
  end
end
