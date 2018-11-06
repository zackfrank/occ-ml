class RemoveSolutionsIdFromFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :fields, :solutions_id, :integer
  end
end
