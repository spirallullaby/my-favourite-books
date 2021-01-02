class CreateDbSchema < ActiveRecord::Migration[6.1]
    def change      
      create_table :book_genres do |t|
        t.string :genre_name
        # Add fields that let Rails automatically keep track
        # of when books are added or modified:
        t.timestamps
      end

      create_table :books do |t|
        t.string :title
        t.text :description
        t.string :isbn
        t.datetime :publish_date
        # Add fields that let Rails automatically keep track
        # of when books are added or modified:
        t.timestamps      
        t.references :book_genres, foreign_key: { to_table: :book_genres }, index: true
      end
    end
end