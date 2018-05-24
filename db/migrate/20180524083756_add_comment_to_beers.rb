class AddCommentToBeers < ActiveRecord::Migration[5.2]
  def change
    add_reference :beers, :beer, foreign_key: true
  end
end
