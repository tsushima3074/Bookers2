class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_edit = Book.find(params[:id])
    @user = User.find(@book_edit.user_id)
    @book_comment = BookComment.new
    @book_comments = BookComment.where(book_id: params[:id])
  end

  def edit
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      @books = Book.all
      redirect_to books_path()
    end
  end

  def create
    @book = Book.new(book_params)
    @user = User.find(current_user.id)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      flash[:notice] = "error"
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
