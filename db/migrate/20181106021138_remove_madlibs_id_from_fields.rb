class RemoveMadlibsIdFromFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :fields, :madlib_id, :integer
  end
end
