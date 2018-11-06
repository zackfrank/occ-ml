class AddTextToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :text, :string
  end
end
