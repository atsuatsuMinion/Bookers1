class BooksController < ApplicationController
  def index
    @book = Book.all
    @newbook = Book.new
  end

  def create
    @newbook = Book.new(book_params)
    if @newbook.save
      flash[:success_create] = "Create Book!!"
      redirect_to book_path(@newbook.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
