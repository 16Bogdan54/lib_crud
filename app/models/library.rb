class Library < ApplicationRecord
  has_many :books
  has_many :user_records

end
