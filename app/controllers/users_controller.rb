class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @usert = User.new(user_params)
    if @user.save
      flash[:notice] = "投稿が成功しました"
      redirect_to user_path(@user.id)
    else
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
    user_id = params[:id]
    login_user_id = current_user.id
  if(user_id != login_user_id)
    redirect_to post_images_path
  end
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
  end

  def update
    user_id = params[:id]
    login_user_id = current_user.id
  if(user_id != login_user_id)
     redirect_to post_images_path
  end
     @user = User.find(current_user.id)
     if @user.update(user_params)
       flash[:notic] = "更新完了しました"
     redirect_to user_path(current_user.id)
     else
     redict:edit
     end
  end



  def destroy
  end

  private

  def user_params
      params.require(:user).permit(:name,  :image, :introduction) # introdution追加
  end
end

