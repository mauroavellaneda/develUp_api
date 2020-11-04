class Api::AssignmentsController < ApplicationController
  def index
    assignments = Assignment.all

    render json: assignments, each_serializer: AssignmentsIndexSerializer
  end

  def create
    assignments = Assignment.create(assignments_params)

    render json: { message: "successfully saved" }
  end

  private

  def assignments_params
    params.require(:assignment).permit(:title, :skills, :points, :budget, :description, :timeframe)
  end
end
