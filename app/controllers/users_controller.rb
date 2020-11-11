class UsersController < ApplicationController
  
  def show
    @user = current_user 
    # if logged_in?
    #   @future_events = current_user.events.upcoming_events
    #   @past_events = current_user.events.past_events
    # else
    #   redirect_to login_path
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}, you have successfully signed up."
      puts flash[:notice]
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
