class Word < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
  end

  belongs_to :user
  belongs_to :book
end
