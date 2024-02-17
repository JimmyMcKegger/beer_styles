class AddSlugToStyles < ActiveRecord::Migration[7.0]
  def change
    add_column :styles, :slug, :string
  end
end
