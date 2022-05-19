class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :inventory
      t.boolean :active, default: true
    end
  end
end
