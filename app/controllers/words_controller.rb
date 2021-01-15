class WordsController < ApplicationController
  before_action :set_word_book, ony: [:new, :create]

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

  private

  def set_word_book
    @book = Book.find(params[:book_id])
  end

  def word_params
    params.require(:word).permit(:name, :info).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end