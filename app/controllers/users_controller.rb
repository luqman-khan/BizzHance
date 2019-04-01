class UsersController < ApplicationController
	before_action :get_organization_users, only: [:show, :index]
  def index
  	
  end

  def show
  	@user = @users.find_by_id(user_params[:user_id])
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(@user.current_pay_rate != user_params[:current_pay_rate] ? user_params.merge(:rate_since, DateTime.now) : user_params)
        format.html { redirect_to organization_user_path(@organization,@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_organization_users
  	@users = @organization.users
  end

  def user_params
  	params.require(:user).permit(:user_id, :name, :role, :current_pay_rate)
  end
end
