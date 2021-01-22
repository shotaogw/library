class WordsController < ApplicationController
  before_action :set_word_book, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_word, only: [:edit, :update, :destroy]
  before_action :move_to_home, only: [:new, :create, :edit, :update, :destroy]

  def index
    @words = @book.words.includes(:user).order(created_at: :DESC).page(params[:page]).per(10)
  end

  def new
    @word = Word.new
  end

  def create
    @word = @book.words.new(word_params)
    if @word.valid?
      @word.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to book_words_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to action: :index
  end

  def show
    @user = current_user
    @words = @user.words.order(created_at: :DESC)
    @books = @user.books
  end

  private

  def set_word_book
    @book = Book.find(params[:book_id])
  end

  def set_word
    @word = @book.words.find(params[:id])
  end

  def move_to_home
    redirect_to controller: :books, action: :index if current_user.id != @book.user_id
  end

  def word_params
    params.require(:word).permit(:name, :info).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
