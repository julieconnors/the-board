class AddRiderColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :rider, :boolean
  end
end
