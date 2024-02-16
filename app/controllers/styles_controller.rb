class StylesController < ApplicationController
  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    style_params = params.require(:style).permit(:name, :description, :fermentation_type, :country)
    @style.update(style_params)

    redirect_to @style
  end


end
