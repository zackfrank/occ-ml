class AddSolutionIdToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :solution_id, :integer
  end
end
