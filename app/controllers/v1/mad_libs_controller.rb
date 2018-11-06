class V1::MadLibsController < ApplicationController
  def create
    mad_lib = MadLib.create(text: params[:text])

    solution = mad_lib.solutions.create
    solution_id = solution.id
    mad_lib.construct_fields

    render json: {fields: mad_lib.fields, solution_id: solution_id}
  end
end
