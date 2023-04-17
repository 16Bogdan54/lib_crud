class Genre < ApplicationRecord
  belongs_to :book

  def self.add
    (1..10).each { |i|
      input = Genre.new(
        name: "name #{i}",
        created_at: Time.now,
        updated_at: Time.now
      )
      input.save
    }
  end

end
