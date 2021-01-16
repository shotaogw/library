class Book < ApplicationRecord
  validates :title, presence: true
  validates :genre_id, numericality: { other_than: 1, message: 'を選択してください' }

  belongs_to :user
  has_many :words, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
