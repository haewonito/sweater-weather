class Api::V1::UsersController < ApplicationController
  def create
    user_params[:email] = user_params[:email].downcase
    user = User.new(user_params)

    if user.password != user.password_confirmation
      render json: { error: 'Passwords do not match.' }, status: 400
    elsif User.find_by(email: user[:email]).present?
      render json: { error: 'A user with the email already exists.' }, status: 400
    else
      user.save
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
