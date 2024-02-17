class AddDetailsToStyles < ActiveRecord::Migration[7.0]
  def change
    add_column :styles, :overall_impression, :text
    add_column :styles, :aroma, :text
    add_column :styles, :appearance, :text
    add_column :styles, :flavor, :text
    add_column :styles, :mouthfeel, :text
    add_column :styles, :history, :text
    add_column :styles, :comments, :text
    add_column :styles, :vital_statistics, :text
    add_column :styles, :commercial_examples, :text
    add_column :styles, :tags, :text
    add_reference :styles, :category, foreign_key: true
  end
end
