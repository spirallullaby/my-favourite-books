class BooksController < ApplicationController
  # index page
  def index
    if !params.key?(:genres)
      params[:genres] = {}
    end
    permitted = params.permit(:sort, genres: params[:genres].keys)
    sort = permitted[:sort] || session[:sort]

    case sort
    when 'title'
      ordering, @title_header = {:title => :asc}, 'hilite'
      @date_header = nil
    when 'publish_date'
      ordering, @date_header = {:publish_date => :asc}, 'hilite'
      @title_header = nil
    end

    @all_genres = Book.all_genres
    @selected_genres = permitted[:genres] || session[:genres] ||  {}
    if @selected_genres == {}
      @selected_genres = Hash[@all_genres.map {|genre| [genre, genre]}]
    end

    if permitted[:sort] != session[:sort] or permitted[:genres] != session[:genres]
      session[:sort] = sort
      session[:genres] = @selected_genres
      redirect_to :sort => sort, :genres => @selected_genres and return
    end

    @books = Book.where(genre: @selected_genres.keys).order(ordering)
  end

  # detail page
  def show
    id = params[:id] # retrieve book id from routed
    @book = Book.find(id) # look it up
  end

  # new book page
  def new
    @book = Book.new
  end

  def create
    params.require(:book)
    permitted = params[:book].permit(:title, :isbn, :author, :genre, :description, :publish_date)
    @book = Book.new(permitted)
    if @book.save
      flash[:notice] = "#{@book.title} was successfully created."
      redirect_to books_path
    else
      render 'new'
    end
  end

  # edit existing book
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    params.require(:book)
    permitted = params[:book].permit(:title, :isbn, :author, :genre, :description, :publish_date)
    if @book.update(permitted)
      flash[:notice] = "#{@book.title} was successfully updated."
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  # delete book
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

  # similar books - same author
  def search_similar_books
    @book = Book.find(params[:id])
    if @book.author.nil? || @book.author.empty?
      flash[:warning] = "'#{@book.title}' has no author info"
      redirect_to books_path
    else
      @books = Book.similar_books(@book)
    end
  end
end
