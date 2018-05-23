class CreateBeerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_comments do |t|
      t.references :comment, foreign_key: true
      t.references :beer, foreign_key: true
    end
  end
end
