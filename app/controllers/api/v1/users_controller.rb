class Api::V1::UsersController < ApplicationController
  def create
    binding.pry
    user = User.create(user_params)
    binding.pry
    if user.valid?
      user.save

    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end
end
