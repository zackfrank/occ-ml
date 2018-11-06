class AddMadLibIdToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :mad_lib_id, :integer
  end
end
