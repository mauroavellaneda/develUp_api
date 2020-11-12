class Api::AssignmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create show update]
  before_action :role_client?, only: [:create]

  def index
    assignments = Assignment.all
    render json: assignments, each_serializer: AssignmentsIndexSerializer
  end

  def create
    assignment = current_user.assignments.create(assignments_params)
    if assignment.persisted?
      render json: { message: 'successfully saved' }
    else
      error_message(assignment.errors)
    end
  end

  def show
    assignment = Assignment.find(params[:id])
    render json: assignment, serializer: AssignmentsShowSerializer
  rescue StandardError => e
    render json: { error_message: 'Sorry, that assignment does not exist' }, status: :not_found
  end

  def update
    assignment = Assignment.find(params[:id])
    if current_user.role == 'develuper'
      if assignment.applicants.include?(current_user.id)
        render json: { message: 'You already applied to this assignment' }, status: :unprocessable_entity
      else
        assignment.applicants.push(current_user.id)
        assignment.save!
        render json: { message: 'successfully applied' }, status: :ok
      end
    else
      if assignment.status == 'ongoing'
        render json: { message: 'You already selected a develUper to this assignment' }, status: :unprocessable_entity
      else assignment.update(update_params)
           render json: { message: 'successfully selected' }, status: :ok
      end
    end
  end

  private

  def assignments_params
    params.require(:assignment).permit(:title, :points, :budget, :description, :timeframe, skills: [], applicants: [])
  end

  def role_client?
    restrict_access unless current_user.role == 'client'
  end

  def restrict_access
    render json: { message: "Sorry, you don't have the necessary permission" }, status: :unauthorized
  end

  def update_params
    params.require(:assignment).permit(:selected, :status)
  end
end
