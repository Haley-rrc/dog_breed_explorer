class DogImage < ApplicationRecord
  belongs_to :breed

  validates :image_url, presence: true, uniqueness: true
  validates :caption, presence: true
end
