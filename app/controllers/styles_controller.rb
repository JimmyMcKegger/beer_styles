class StylesController < ApplicationController
  def index
    @styles = Style.all
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    @style.save

    redirect_to @style
  end

  def show
    @style = Style.find(params[:id])
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    @style.update(style_params)

    redirect_to @style
  end

  private

  def style_params
    params.require(:style).permit(:name, :description, :fermentation_type, :country)
  end

end
