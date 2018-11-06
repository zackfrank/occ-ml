class AddFormattedLabelToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :formatted_label, :string
  end
end
