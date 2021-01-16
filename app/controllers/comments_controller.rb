class CommentsController < ApplicationController
  before_action :set_comment_book, only: [:index, :create]

  def index
    @comment = Comment.new
    @comments = @book.comments.includes(:user).order(created_at: :DESC)
  end

  def create
    @comment = @book.comments.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to action: :index
    else
      @comments = @book.comments.includes(:user).order(created_at: :DESC)
      render :index
    end
  end

  private

  def set_comment_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
