class Api::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    begin
      develuper = User.find(params[:id])
      
      render json: develuper, serializer: DeveluperShowSerializer
    rescue => error
      render json: { error_message: "Sorry, user does not exist" }, status: :not_found
    end
  end
end
