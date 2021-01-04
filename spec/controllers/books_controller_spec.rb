require "rails_helper"
 describe BooksController do
  describe 'Search books with the same author' do
   it 'calls the model method that performs the search' do
      given_book = double("book_1", title: 'To Kill A Mockingbird', author: 'Harper Lee')
      allow(Book).to receive(:find).with("1").and_return(given_book)
      expect(Book).to receive(:similar_books).with(given_book)
      get :search_similar_books, params: {id:1}
     end
   it 'finds the book with the given id' do
      given_book = double("book_1", title: 'To Kill A Mockingbird', author: 'Harper Lee')
      expect(Book).to receive(:find).with("1").and_return(given_book)
      get :search_similar_books, params: {id:1}
     end
   it 'selects the Similar books template for rendering' do
      given_book = double("book_1", title: 'To Kill A Mockingbird', author: 'Harper Lee')
      allow(Book).to receive(:find).with("1").and_return(given_book)
      allow(Book).to receive(:similar_books).with(given_book)
      get :search_similar_books, params: {id:1}
      expect(response).to render_template('search_similar_books')
    end
   it 'makes the search results available to that template'  do
      given_book = double("book_1", title: 'Guards!Guards!', author: 'Terry Pratchett')
      allow(Book).to receive(:find).with("1").and_return(given_book)
      @fake_results = [double(Book), double(Book)]
      allow(Book).to receive(:similar_books).with(given_book).and_return(@fake_results)
      get :search_similar_books, params: {id:1}
      expect(assigns(:books)).to eq(@fake_results)
    end 
    it "redirects to books_path with warning" do
      given_book = double("Book_1", title: '1984', author: '')
      expect(Book).to receive(:find).with("1").and_return(given_book)
      get :search_similar_books, params: {id:1}
      expect(flash[:warning]).to eq "'#{given_book.title}' has no author info"
      expect(response).to redirect_to(books_path)
     end
  end
 end
