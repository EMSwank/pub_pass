class AddBeersToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_reference :breweries, :beer, foreign_key: true
  end
end
