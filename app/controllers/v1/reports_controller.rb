class V1::ReportsController < ApplicationController
  def index
    report = ReportGenerator.new
    render json: report
  end
end
