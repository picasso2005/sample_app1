class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def destroy
  end

    def create
      
      @user = User.find_by(account: params[:session][:account])
      if @user && @user.authenticate(params[:session][:password])
        sign_in @user
        redirect_to @user
      # Sign the user in and redirect to the user's show page.
      else
        flash[:error] = 'Invalid email/password combination'
        render 'new'
      # Create an error message and re-render the signin form.
      end
    end

  def show
    @user = User.find(params[:id])
  end

  
end
