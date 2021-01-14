class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

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

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
