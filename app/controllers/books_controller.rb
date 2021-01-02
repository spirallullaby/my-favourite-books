class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def show
    id = params[:id] # retrieve book id from route
    @book = Book.find(id)# look it up
   end
  def new
    @book = Book.new
  end
  def create
    params.require(:book)
    permitted = params[:book].permit(:title, :isbn, :genre, :description, :publish_date)
    @book = Book.create!(permitted)
    flash[:notice] = "#{@book.title} was successfully created."
    redirect_to book_path
   end
   def edit
    @book = Book.find params[:id]
   end
   def update
    @book = Book.find params[:id]
    params.require(:book)
    permitted = params[:book].permit(:title, :isbn, :genre, :description, :publish_date)
    @book.update_attributes!(permitted)
    flash[:notice] = "#{@book.title} was successfully updated."
    redirect_to books_path(@book)
   end
   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
   end
end
