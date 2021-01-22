class BookmarksController < ApplicationController
  before_action :set_book, only: [:create, :destroy]

  def create
    bookmark = current_user.bookmarks.build(book_id: params[:book_id])
    bookmark.save
  end

  def destroy
    bookmark = Bookmark.find_by(book_id: params[:book_id], user_id: current_user.id)
    bookmark.destroy
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
