class Breed < ApplicationRecord
  has_many :sub_breeds, dependent: :destroy
  has_many :dog_images, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end