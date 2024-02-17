# frozen_string_literal: true

class AddBjcpCategoryToStyles < ActiveRecord::Migration[7.0]
  def change
    add_column :styles, :bjcp_category, :string
  end
end
