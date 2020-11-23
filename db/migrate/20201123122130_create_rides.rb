class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.datetime :time
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
