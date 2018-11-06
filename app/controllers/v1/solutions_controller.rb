class V1::SolutionsController < ApplicationController
  
  def update
    solution = Solution.find(params[:id])

    values = params[:values]

    values.each do |field, value|
      solution.fill_field(field, with: value)
    end

    render json: solution.resolve
  end

end
