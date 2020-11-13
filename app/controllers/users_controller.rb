class UsersController < ApplicationController
  
  def show
    @user = current_user 
    @articles = @user.articles.order('created_at DESC').includes(:votes)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}, you have successfully signed up."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
