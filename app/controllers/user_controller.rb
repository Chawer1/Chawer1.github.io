class UserController < ApplicationController
   before_action :correct_user,   only: [:edit, :update]
   def destroy
      @users = User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to "http://localhost:3000/"
   end
end