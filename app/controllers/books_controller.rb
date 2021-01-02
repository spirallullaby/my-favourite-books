class BooksController < ApplicationController
  def index
    @books = Book.joins(:book_genres).select("books.*, book_genres.genre_name as genre_name")
  end
  def show
    id = params[:id] # retrieve book id from route
    @book = Book.joins(:book_genres)
          .select("books.*, book_genres.genre_name as genre_name")
          .find(id) # look it up
   end
  def new
    @book = Book.new
    @book_genres = BookGenre.select("book_genres.genre_name").uniq
  end
   
end
