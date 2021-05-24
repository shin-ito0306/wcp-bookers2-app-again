class BooksController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book_show = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@book_show.user.id)
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private
  
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
  
end
