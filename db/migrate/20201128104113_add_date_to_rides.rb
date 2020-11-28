class AddDateToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :day, :date
  end
end
