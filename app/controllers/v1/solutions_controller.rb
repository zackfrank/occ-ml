class V1::SolutionsController < ApplicationController

  def create
    solution = Solution.find(params[:id])
    fields = solution.fields

    fields.each do |field|
      solution.fill_field(field.formatted_label, with: field.value)
    end

    render json: solution.resolve
  end

end
