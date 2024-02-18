# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :require_signin
  before_action :require_admin, only: %i[new create edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by!(params[:id])
    @styles = @category.styles
  end
end
