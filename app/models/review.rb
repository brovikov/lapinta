class Review < ApplicationRecord
  validates :name, :intro, :body, presence: true
end
