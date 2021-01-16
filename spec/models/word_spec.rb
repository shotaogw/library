require 'rails_helper'

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe '新規ワード作成' do
    context 'ワードが作成できるとき' do
      it '必要な情報を適切に入力するとワード作成ができる' do
        expect(@word).to be_valid
      end
    end

    context 'ワード作成ができないとき' do
      it 'nameが空では作成できない' do
        @word.name = ''
        @word.valid?
        expect(@word.errors.full_messages).to include('単語を入力してください')
      end
      it 'infoが空では作成できない' do
        @word.info = ''
        @word.valid?
        expect(@word.errors.full_messages).to include('定義を入力してください')
      end
      it 'userが紐づいていないと作成できない' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'bookが紐づいていないと作成できない' do
        @word.book = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('ブックを入力してください')
      end
    end
  end
end
