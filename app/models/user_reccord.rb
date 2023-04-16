class UserReccord < ApplicationRecord
  belongs_to :library
  has_one :user
end
