class V1::SolutionsController < ApplicationController
  
  # def update
  #   solution = Solution.find(params[:id])

  #   fields = solution.fields

  #   values.each do |field, value|
  #     solution.fill_field(field, with: value)
  #   end

  #   render json: solution.resolve
  # end
  
  def show
    solution = Solution.find(params[:id])
    fields = solution.fields

    fields.each do |field|
      solution.fill_field(field.formatted_label, with: field.value)
    end

    render json: solution.resolve
  end

end
