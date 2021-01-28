class QuizzesController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @quizzes = @book.words.order('RAND()').limit(10)
  end

  def show
    @book = Book.find(params[:book_id])
  end
end
