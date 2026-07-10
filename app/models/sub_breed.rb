class SubBreed < ApplicationRecord
  belongs_to :breed

  validates :name, presence: true
  validates :name, uniqueness: { scope: :breed_id }
end
