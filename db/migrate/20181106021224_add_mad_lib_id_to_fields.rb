class AddMadLibIdToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :mad_lib_id, :integer
    add_column :fields, :solutions_id, :integer
  end
end
