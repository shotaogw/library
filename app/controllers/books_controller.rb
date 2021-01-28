class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_book, only: [:search, :quiz_index]

  def index
    @books = Book.all.includes(:user).order(created_at: :DESC).page(params[:page]).per(10)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to new_book_word_path(@book.id)
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

  def destroy
    @book.destroy
    flash[:notice] = '削除が完了しました'
    redirect_to action: :index
  end

  def search
  end

  def quiz_index
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre_id, :image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user != @book.user
  end

  def search_book
    @q = Book.ransack(params[:q])
    @results = @q.result.includes(:user).order(created_at: :DESC).page(params[:page]).per(10)
  end
end
