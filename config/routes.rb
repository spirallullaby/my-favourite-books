
Rails.application.routes.draw do
  get 'books/index'
  resources :books
  root :to => redirect('/books')
 end