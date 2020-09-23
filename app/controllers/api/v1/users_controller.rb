class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: ErrorsSerializer.new(ErrorFacade.new(user).messages), status: :bad_request
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
