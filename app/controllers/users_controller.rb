class UsersController < ApplicationController
  
  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
end
