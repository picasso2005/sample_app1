class UsersController < ApplicationController
  def index
  end

  def show
    @user =User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] ="Welcome to My Website"
      redirect_to '/'
    # Handle a successful save.
    else
     render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  def seach
  end

  def new
   
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:code ,:firstname,:lastname, :account,:email,:password,:password_confirmation)
  end

end
  

