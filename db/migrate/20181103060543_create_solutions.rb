class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.integer :madlib_id

      t.timestamps
    end
  end
end
