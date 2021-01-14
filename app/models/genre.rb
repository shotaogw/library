class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '歴史' },
    { id: 3, name: '政治' },
    { id: 4, name: '経済' },
    { id: 5, name: '国語' },
    { id: 6, name: '数学' },
    { id: 7, name: '物理' },
    { id: 8, name: '化学' },
    { id: 9, name: '生物' },
    { id: 10, name: '語学' },
    { id: 11, name: '投資' },
    { id: 12, name: 'IT' },
    { id: 13, name: '雑学' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :books
end
