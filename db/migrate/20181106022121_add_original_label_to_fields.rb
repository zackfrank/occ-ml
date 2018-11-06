class AddOriginalLabelToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :original_label, :string
  end
end
