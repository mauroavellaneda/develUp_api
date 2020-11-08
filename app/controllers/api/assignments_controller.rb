class Api::AssignmentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :show]
  before_action :role_client?, only: [:create]

  def index
    assignments = Assignment.all
    render json: assignments, each_serializer: AssignmentsIndexSerializer
  end

  def create
    assignment = current_user.assignments.create(assignments_params)

    if assignment.persisted?
      render json: { message: "successfully saved" }
    else
      error_message(assignment.errors)
    end
  end

  def show
    begin
    assignment = Assignment.find(params[:id])
      render json: assignment, serializer: AssignmentsShowSerializer
    rescue => error
      render json: { error_message: "Sorry, that assignment does not exist" }, status: :not_found
    end
  end

  def update
    
  end

  private

  def assignments_params
    params.require(:assignment).permit(:title, :points, :budget, :description, :timeframe, :skills => [])
  end

  def role_client?
    unless current_user.role == "client"
      restrict_access
    end
  end

  def restrict_access
    render json: { message: "Sorry, you don't have the necessary permission" }, status: :unauthorized
  end
end
