class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :owner
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
