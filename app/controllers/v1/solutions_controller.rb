class V1::SolutionsController < ApplicationController
  
  def update
    solution = Solution.find(params[:solution_id])
  end

end
