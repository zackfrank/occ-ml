class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :label
      t.string :value
      t.integer :madlib_id

      t.timestamps
    end
  end
end
