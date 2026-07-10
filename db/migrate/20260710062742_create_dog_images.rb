class CreateDogImages < ActiveRecord::Migration[7.2]
  def change
    create_table :dog_images do |t|
      t.string :image_url
      t.string :caption
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
