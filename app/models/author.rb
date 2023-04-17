class Author < ApplicationRecord
  belongs_to :book

  def self.add
    (1..10).each { |i|
      q = "INSERT INTO authors(name, bio, created_at, updated_at) VALUES ('name #{i.to_s}', 'bio #{i.to_s}', NOW(), NOW())"
      ActiveRecord::Base.connection.execute(q)
    }
  end
end
