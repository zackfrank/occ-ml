class V1::FieldsController < ApplicationController
  def update
    fields = params[:fields]
    values = params[:values]
    s_id = params[:solution_id]

    fields.each do |field|
      db_entry = Field.find(field[:id])
      value_pair = values.select {|key, value| key.to_s == db_entry.formatted_label }
      db_entry.value = value_pair[db_entry.formatted_label]
      db_entry.solution_id = s_id
      db_entry.save
    end

    updated_fields = Solution.find(s_id).fields

    render json: updated_fields
  end
end
