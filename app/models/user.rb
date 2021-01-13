class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password_confirmation, on: :create
    validates :profile
  end
  validates :email, uniqueness: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'を半角英数字で入力してください' }, on: :create
end
