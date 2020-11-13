class Api::AssignmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create show update]
  before_action :role_client?, only: [:create]

  def index
    assignments = if client_index?
        Assignment.where(client_id: params["client_id"])
      else
        Assignment.where(status: "published")
      end
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
    assignment = Assignment.find(params[:id])
    render json: assignment, serializer: AssignmentsShowSerializer
  rescue StandardError => e
    render json: { error_message: "Sorry, that assignment does not exist" }, status: :not_found
  end

  def update
    assignment = Assignment.find(params[:id])
    case current_user.role
    when "develuper"
      develuper_update(assignment)
    when "client"
      client_update(assignment)
    end
  end

  private

  def client_index?
    !params["client_id"].nil?
  end

  def assignments_params
    params.require(:assignment).permit(:title, :points, :budget, :description, :timeframe, skills: [], applicants: [])
  end

  def role_client?
    restrict_access unless current_user.role == "client"
  end

  def restrict_access
    render json: { message: "Sorry, you don't have the necessary permission" }, status: :unauthorized
  end

  def develuper_update(assignment)
    assignment.applicants.include?(current_user.id) ?
      (render json: { message: "You already applied to this assignment" }, status: :unprocessable_entity) :
      (assignment.applicants.push(current_user.id)
      assignment.save!
      render json: { message: "successfully applied" }, status: :ok)
  end

  def client_update(assignment)
    assignment.selected ? (render json: { message: "You already selected a develUper to this assignment" }, status: :unprocessable_entity) :
      (assignment.update!(update_params)
      render json: { message: "successfully selected" }, status: :ok)
  end

  def update_params
    params.require(:assignment).permit(:selected, :status)
  end
end
