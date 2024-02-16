class StylesController < ApplicationController
  def index

    @styles = ["IPA", "Stout", "Lager", "Pilsner", "Porter", "Saison", "Wheat", "Pale Ale", "Amber Ale", "Brown Ale", "Barleywine", "Sour", "Cider", "Mead", "Kombucha", "Hard Seltzer", "Non-Alcoholic", "Other"]
  end
end
