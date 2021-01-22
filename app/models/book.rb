class Book < ApplicationRecord
  def self.all_genres
    [
      'Science fiction',
      'Drama',
      'Action and Adventure',
      'Romance',
      'Mystery',
      'Horror'
    ]
  end
  validates :title, :presence => true
  validates :publish_date, :presence => true
  validate :published_1967_or_later # uses custom validator below
  validates :genre, :inclusion => {:in => Book.all_genres}
  def published_1967_or_later
    errors.add(:isbn, 'must be added if the book was published after 1967') if
    publish_date > Date.parse('1 Jan 1967') && (isbn.nil? || isbn.empty?)
  end
  before_save do
    self.title = title.split.map(&:capitalize).join(' ')
  end
  def self.similar_books(book)
    Book.where author: book.author
  end
end
