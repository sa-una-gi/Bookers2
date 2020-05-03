class BooksController < ApplicationController

   before_action :authenticate_user!

  def top
  end

  def index
   @books = Book.all.order(created_at: :desc)
   @book = Book.new
   @user = current_user
   user = @book.user
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    user = @book.user
    @user = @book.user
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      flash[:success] = "You have creatad book successfully."
  	  redirect_to book_path(@book)
    else
      @books = Book.all.order(created_at: :desc)
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
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
    params.require(:book).permit(:title, :body)
  end

end
