class BooksController < ApplicationController
  def index
    @book = Book.all
    @newbook = Book.new
  end

  def create
    @book = Book.all
    @newbook = Book.new(book_params)
    if @newbook.save
      flash[:success_create] = "Book was successfully created."
      redirect_to book_path(@newbook.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success_update] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
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
