class RemoveTypeColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :type
  end
end
