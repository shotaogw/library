require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'ブックへのコメント' do
    context 'コメントできるとき' do
      it '必要な情報を適切に入力するとコメントができる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできないとき' do
      it 'contentが空ではコメントできない' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'userが紐づいていないとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'bookが紐づいていないとコメントできない' do
        @comment.book = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('ブックを入力してください')
      end
    end
  end
end
