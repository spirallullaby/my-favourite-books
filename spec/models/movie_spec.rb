require 'rails_helper'
 describe Book do
  describe "search for similar books" do
   before :each do
    @book1 = FactoryBot.create(:book, title: '1984', author: 'George Orwell')
    @book2 = FactoryBot.create(:book, title: 'Animal Farm', author: 'George Orwell')
    @book3 = FactoryBot.create(:book, title: 'Harry Potter', author: 'J.K.Rowling')
   end
   it 'it should find books with the same author' do
    expect(Book.similar_books(@book1)).to eq([@book1, @book2])
    expect(Book.similar_books(@book3)).to eq([@book3])
   end
   it 'it should not find books with different author' do
    expect(Book.similar_books(@book1)).to_not include([@book3])
    expect(Book.similar_books(@book3)).to_not include([@book1, @book2])
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

