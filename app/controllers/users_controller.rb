class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @usert = User.new(user_params)
    if @user.save
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :new
    end
  end

  def index
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    user_id = params[:id]
    login_user_id = current_user.id
   if(user_id != login_user_id)
     redirect_to users_path
   end
    @user = User.find(current_user.id)
   if @user.update(user_params)
    flash[:notic] = "successfully"
   else
    flash[:nitic]="error"
    redict:edit
   end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name,  :image, :introduction)
  end
end
