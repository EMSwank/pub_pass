class AddBeersToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :beer, foreign_key: true
  end
end
