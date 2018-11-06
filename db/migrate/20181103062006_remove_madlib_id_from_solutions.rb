class RemoveMadlibIdFromSolutions < ActiveRecord::Migration[5.1]
  def change
    remove_column :solutions, :madlib_id, :integer
  end
end
