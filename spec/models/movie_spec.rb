require 'rails_helper'
describe Book do
  describe 'search for similar books' do
    before :each do
      @book1 = FactoryBot.create(:book, title: '1984', author: 'George Orwell')
      @book2 = FactoryBot.create(:book, title: 'Animal Farm', author: 'George Orwell')
      @book3 = FactoryBot.create(:book, title: 'Harry Potter', author: 'J.K.Rowling')
    end
    # happy path
    it 'it should find books with the same author' do
      expect(Book.similar_books(@book1)).to eq([@book1, @book2])
      expect(Book.similar_books(@book3)).to eq([@book3])
    end
    # sad path
    it 'it should not find books with different author' do
      expect(Book.similar_books(@book1)).to_not include([@book3])
      expect(Book.similar_books(@book3)).to_not include([@book1, @book2])
    end
  end
end
