class Idea < ApplicationRecord
  validates(:title, presence: true, uniqueness: true)

  validates :description, presence: { message: "You must include a description"}
end
