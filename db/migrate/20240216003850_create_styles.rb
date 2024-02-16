class CreateStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :description
      t.string :fermentation_type
      t.string :country

      t.timestamps
    end
  end
end
