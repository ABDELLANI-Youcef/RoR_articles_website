class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    puts "\n\n\n\n user == #{user[:name]} \n\n\n\n\n"
    unless user.nil?
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully.'
      redirect_to user
    else
      flash.now[:alert] = 'You entered incorrect name.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out.'
    redirect_to login_path
  end

  private

  def user_params
    params.require(:session).permit(:name)
  end
end
