class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    p params
    return redirect_to new_session_path if !logged_in?
    return redirect root_path if !authorized?(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :url)
  end

end
