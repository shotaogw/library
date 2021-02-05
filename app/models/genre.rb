class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '用語' },
    { id: 3, name: 'データベース' },
    { id: 4, name: 'HTML/CSS' },
    { id: 5, name: 'JavaScript' },
    { id: 6, name: 'Ruby' },
    { id: 7, name: 'PHP' },
    { id: 8, name: 'Python' },
    { id: 9, name: 'Java' },
    { id: 10, name: 'C#' },
    { id: 11, name: 'Swift' }
  ]

  include ActiveHash::Associations
  has_many :books
end
