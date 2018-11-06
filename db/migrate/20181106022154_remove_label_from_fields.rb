class RemoveLabelFromFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :fields, :label, :string
  end
end
