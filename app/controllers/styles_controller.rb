# frozen_string_literal: true

class StylesController < ApplicationController
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
    @style = Style.find(params[:id])
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    if @style.update(style_params)
      flash[:notice] = 'Style updated successfully'
      redirect_to @style
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy

    redirect_to styles_url, status: :see_other
  end

  private

  def style_params
    params.require(:style).permit(:name, :description, :fermentation_type, :country)
  end
end
