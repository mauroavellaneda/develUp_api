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
    assignment = Assignment.find(params[:id])
    # assignment2 = Assignment.update(assignments_params)
    if assignment.applicants.include?(User.last.id)
      binding.pry
    #   assignment2 = Assignment.update(assignments_params)
    #   binding.pry
     else
      # assignment.applicants_will_change!
      assignment.applicants.push(User.last.id)
      # assignment2 = Assignment.update(assignments_params)
      binding.pry
      # save
     end

  


  end

  private

  def assignments_params
    params.require(:assignment).permit(:title, :points, :budget, :description, :timeframe, :skills => [], :applicants => [] )
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
