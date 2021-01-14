class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :DESC)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre_id).merge(user_id: current_user.id)
  end
end