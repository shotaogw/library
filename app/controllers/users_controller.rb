class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.order(created_at: :DESC)
  end
end
