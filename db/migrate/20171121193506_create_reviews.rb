class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string  :name
      t.string  :description
      t.integer :price_in_cents
      t.integer :rating
      t.string  :featured_image
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
