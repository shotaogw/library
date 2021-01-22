require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  before do
    @bookmark = FactoryBot.build(:bookmark)
  end

  describe 'ブックマーク' do
    context 'ブックマークができるとき' do
      it '必要な情報が適切に紐づいていればブックマークができる' do
        expect(@bookmark).to be_valid
      end
    end

    context 'ブックマークができないとき' do
      it 'userが紐づいていないとブックマークできない' do
        @bookmark.user = nil
        @bookmark.valid?
        expect(@bookmark.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'bookが紐づいていないとブックマークできない' do
        @bookmark.book = nil
        @bookmark.valid?
        expect(@bookmark.errors.full_messages).to include('ブックを入力してください')
      end
    end
  end
end
