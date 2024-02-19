# frozen_string_literal: true

class StylesController < ApplicationController
  before_action :require_signin
  before_action :require_admin, only: %i[new create edit update destroy]
  before_action :set_style, only: %i[show edit update destroy]

  def index
    @styles = Style.all
  end

  def american
    @styles = Style.american
    render :index
  end

  def german
    @styles = Style.german
    render :index
  end

  def british
    @styles = Style.british
    render :index
  end

  def belgian
    @styles = Style.belgian
    render :index
  end

  def historical
    @styles = Style.historical
    render :index
  end

  def uncategorised
    @styles = Style.uncategorised
    render :index
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to @style
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @like = current_user.liked_styles.find_by(slug: params[:id])
  end

  def edit; end

  def update
    if @style.update(style_params)
      flash[:notice] = 'Style updated successfully'
      redirect_to @style
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @style.destroy

    redirect_to styles_url, status: :see_other
  end

  private

  def set_style
    @style = Style.find_by!(slug: params[:id])
  end

  def style_params
    params.require(:style).permit(
      :name,
      :description,
      :bjcp_category,
      :fermentation_type,
      :country,
      :category_id,
      :overall_impression,
      :aroma,
      :appearance,
      :flavor,
      :mouthfeel,
      :history,
      :comments,
      :vital_statistics,
      :commercial_examples,
      :tags
    )
  end
end
