class Idea < ApplicationRecord
  validates(:title, presence: true, uniqueness: true)
  validates :description, presence: { message: "You must include a description"}
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy

end
