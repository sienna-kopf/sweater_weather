class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(user_params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: ErrorsSerializer.new(user).errors_hash, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
