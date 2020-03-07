class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_users
  # before_action :sign_in, only: [:index, :edit, :update, :destroy]
  # before_action :sign_in  , only: [:index, :edit, :update, :destroy]
  private

  def set_users
    @users = User.all
  end

  after_action :user_activity

  private

  def user_activity
    current_user.try :touch
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
    end

  def destroy
    @users = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

end
