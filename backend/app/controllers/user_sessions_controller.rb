class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = login(params[:email], params[:password], true)

    if @user
      render :show, status: :ok, location: @user 
    else
      render json: { error: "email or password did not match" }, status: :unprocessable_entity 
    end
  end

  def destroy
    logout
    head :no_content 
  end
end
