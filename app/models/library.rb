class Library < ApplicationRecord
  has_many :books
  has_many :user_records

  def self.add
    (1..10).each { |i|
      loc = i % 2 == 0 ? 'Kharkiv' : 'Odessa'
      q = "INSERT INTO libraries(name, location, created_at, updated_at) VALUES ('name #{i}', '#{loc} #{i}', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
    }
  end

  def book_count
    books.count
  end

  def genre_count
    books.select(:genre_id).distinct.count
  end
end
