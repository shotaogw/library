require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '新規ブック作成' do
    context 'ブックが作成できるとき' do
      it '必要な情報を適切に入力するとブック作成ができる' do
        expect(@book).to be_valid
      end
    end

    context 'ブック作成ができないとき' do
      it 'titleが空では作成できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'genre_idの情報がないと作成できない' do
        @book.genre_id = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('ジャンルを選択してください')
      end
      it 'genre_idが1では作成できない' do
        @book.genre_id = 1
        @book.valid?
        expect(@book.errors.full_messages).to include('ジャンルを選択してください')
      end
      it 'userが紐づいていないと作成できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
