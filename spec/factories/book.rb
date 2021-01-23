FactoryBot.define do
  factory :book do
    title { 'A Fake Title' } # default values
    genre { 'Horror' }
    publish_date { 20.years.ago }
    author { 'John Doe' }
    isbn { '1234567890' }
  end
end
