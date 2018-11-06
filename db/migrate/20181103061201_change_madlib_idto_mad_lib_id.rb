class ChangeMadlibIdtoMadLibId < ActiveRecord::Migration[5.1]
  def change
    change_column :solutions, :madlib_id, :mad_lib_id
  end
end
