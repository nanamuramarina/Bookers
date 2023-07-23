class BooksController < ApplicationController
  def new
    @book = Book.all
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
   if @book.save
     flash[:notice] = "successfully"
     redirect_to books_path
   else
     flash[:notic]="error"
  　 remder :new
   end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @books =Book.find(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error"
      redict:edit
    end
  end
    

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
