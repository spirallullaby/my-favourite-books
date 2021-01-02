class Book < ApplicationRecord    
    belongs_to :book_genres, class_name: 'BookGenre'
end